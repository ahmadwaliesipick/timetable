import {
  Absence,
  Arrangement,
  ClassSection,
  Period,
  SchoolProfile,
  Subject,
  Teacher,
  TimetableSlot,
} from './models';
import { className, periodName, subjectName, teacherName } from './suggestion.logic';

export interface DailyBoardRow {
  period: string;
  className: string;
  subject: string;
  absentTeacher: string;
  coverTeacher: string;
  status: string;
}

export function buildDailyBoardRows(
  arrangements: Arrangement[],
  slots: TimetableSlot[],
  teachers: Teacher[],
  subjects: Subject[],
  classes: ClassSection[],
  periods: Period[],
  confirmedOnly = false
): DailyBoardRow[] {
  const periodOrder = new Map(periods.map((p) => [p.id, p.sortOrder]));
  const rows = arrangements
    .filter((a) => !confirmedOnly || a.status === 'confirmed')
    .map((a) => {
      const slot = slots.find((s) => s.id === a.timetableSlotId);
      return {
        period: slot ? periodName(periods, slot.periodId) : '—',
        className: slot ? className(classes, slot.classSectionId) : '—',
        subject: slot ? subjectName(subjects, slot.subjectId) : '—',
        absentTeacher: teacherName(teachers, a.originalTeacherId),
        coverTeacher: teacherName(teachers, a.substituteTeacherId),
        status: a.status,
        sort: slot ? periodOrder.get(slot.periodId) ?? 99 : 99,
      };
    })
    .sort((a, b) => a.sort - b.sort || a.className.localeCompare(b.className));

  return rows.map(({ sort: _sort, ...row }) => row);
}

export function buildWhatsAppMessage(
  profile: SchoolProfile,
  dateIso: string,
  absences: Absence[],
  rows: DailyBoardRow[],
  teachers: Teacher[]
): string {
  const absentNames = absences
    .map((a) => teacherName(teachers, a.teacherId))
    .filter((n) => n !== '—');

  const lines = [
    `*${profile.shortName || profile.name}*`,
    `Daily cover arrangements — ${dateIso}`,
    '',
  ];

  if (absentNames.length) {
    lines.push(`Absent: ${absentNames.join(', ')}`, '');
  }

  if (!rows.length) {
    lines.push('No cover arrangements for this date.');
  } else {
    lines.push('*Cover board*');
    for (const r of rows) {
      const mark = r.status === 'confirmed' ? '✓' : r.status === 'suggested' ? '~' : '!';
      lines.push(
        `${mark} ${r.period} · ${r.className} · ${r.subject}`,
        `   ${r.absentTeacher} → ${r.coverTeacher}`
      );
    }
  }

  lines.push('', '_Please check My day in Timetable Desk._');
  return lines.join('\n');
}

/** Builds the printable HTML for the daily cover board. */
export function buildDailyBoardHtml(
  profile: SchoolProfile,
  dateIso: string,
  absences: Absence[],
  rows: DailyBoardRow[],
  teachers: Teacher[]
): string {
  const absentNames = absences
    .map((a) => teacherName(teachers, a.teacherId))
    .filter((n) => n !== '—')
    .join(', ');

  const bodyRows = rows.length
    ? rows
        .map(
          (r) => `<tr>
            <td>${escapeHtml(r.period)}</td>
            <td>${escapeHtml(r.className)}</td>
            <td>${escapeHtml(r.subject)}</td>
            <td>${escapeHtml(r.absentTeacher)}</td>
            <td><strong>${escapeHtml(r.coverTeacher)}</strong></td>
            <td>${escapeHtml(r.status)}</td>
          </tr>`
        )
        .join('')
    : `<tr><td colspan="6">No arrangements for this date.</td></tr>`;

  return `<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Daily cover — ${escapeHtml(dateIso)}</title>
  <style>
    body { font-family: Georgia, "Times New Roman", serif; color: #1c2a32; margin: 24px; }
    h1 { font-size: 20px; margin: 0 0 4px; }
    .sub { color: #5c6b74; margin: 0 0 16px; font-size: 13px; }
    table { width: 100%; border-collapse: collapse; font-size: 12px; }
    th, td { border: 1px solid #c9bfae; padding: 8px 6px; text-align: left; vertical-align: top; }
    th { background: #f3efe6; text-transform: uppercase; letter-spacing: 0.04em; font-size: 10px; }
    .meta { margin-bottom: 14px; font-size: 13px; }
    @media print {
      body { margin: 12px; }
      .no-print { display: none; }
    }
  </style>
</head>
<body>
  <p class="no-print" style="font-family: sans-serif; font-size: 13px; color: #5c6b74;">
    Use <strong>Print → Save as PDF</strong>, then share the file in your WhatsApp group.
  </p>
  <h1>${escapeHtml(profile.name)}</h1>
  <p class="sub">Daily teacher cover arrangements</p>
  <div class="meta">
    <div><strong>Date:</strong> ${escapeHtml(dateIso)}</div>
    ${absentNames ? `<div><strong>Absent:</strong> ${escapeHtml(absentNames)}</div>` : ''}
  </div>
  <table>
    <thead>
      <tr>
        <th>Period</th>
        <th>Class</th>
        <th>Subject</th>
        <th>Absent</th>
        <th>Cover teacher</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>${bodyRows}</tbody>
  </table>
</body>
</html>`;
}

/**
 * Opens the system print dialog (Save as PDF) via a hidden iframe.
 * Avoids window.open + noopener, which returns null and breaks export in modern browsers.
 */
export function openDailyBoardPrint(
  profile: SchoolProfile,
  dateIso: string,
  absences: Absence[],
  rows: DailyBoardRow[],
  teachers: Teacher[]
): void {
  const html = buildDailyBoardHtml(profile, dateIso, absences, rows, teachers);
  const iframe = document.createElement('iframe');
  iframe.setAttribute('title', 'Daily cover print');
  iframe.style.position = 'fixed';
  iframe.style.right = '0';
  iframe.style.bottom = '0';
  iframe.style.width = '0';
  iframe.style.height = '0';
  iframe.style.border = '0';
  iframe.style.opacity = '0';
  iframe.style.pointerEvents = 'none';
  document.body.appendChild(iframe);

  const frameWindow = iframe.contentWindow;
  const frameDoc = frameWindow?.document;
  if (!frameWindow || !frameDoc) {
    iframe.remove();
    throw new Error('Could not open print view. Try again in another browser.');
  }

  frameDoc.open();
  frameDoc.write(html);
  frameDoc.close();

  const cleanup = () => {
    setTimeout(() => iframe.remove(), 1000);
  };

  const triggerPrint = () => {
    try {
      frameWindow.focus();
      frameWindow.print();
    } finally {
      cleanup();
    }
  };

  // Give the frame a moment to layout before printing.
  setTimeout(triggerPrint, 300);
}

export function openWhatsAppShare(message: string): void {
  const url = `https://wa.me/?text=${encodeURIComponent(message)}`;
  window.open(url, '_blank', 'noopener,noreferrer');
}

function escapeHtml(value: string): string {
  return value
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}
