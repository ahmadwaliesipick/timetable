import {
  Absence,
  Arrangement,
  ClassSection,
  Period,
  SchoolData,
  Subject,
  Teacher,
  TimetableSlot,
  uid,
} from './models';

export function createSeedData(): SchoolData {
  const periods: Period[] = [
    { id: 'p1', name: 'Period 1', sortOrder: 1, startTime: '08:00', endTime: '08:45' },
    { id: 'p2', name: 'Period 2', sortOrder: 2, startTime: '08:50', endTime: '09:35' },
    { id: 'p3', name: 'Period 3', sortOrder: 3, startTime: '09:40', endTime: '10:25' },
    { id: 'p4', name: 'Period 4', sortOrder: 4, startTime: '10:40', endTime: '11:25' },
    { id: 'p5', name: 'Period 5', sortOrder: 5, startTime: '11:30', endTime: '12:15' },
    { id: 'p6', name: 'Period 6', sortOrder: 6, startTime: '12:20', endTime: '13:05' },
  ];

  const subjects: Subject[] = [
    { id: 's-math', name: 'Mathematics', code: 'MATH' },
    { id: 's-eng', name: 'English', code: 'ENG' },
    { id: 's-sci', name: 'Science', code: 'SCI' },
    { id: 's-hist', name: 'History', code: 'HIST' },
  ];

  const classSections: ClassSection[] = [
    { id: 'c-7a', name: '7A', grade: '7' },
    { id: 'c-7b', name: '7B', grade: '7' },
    { id: 'c-8a', name: '8A', grade: '8' },
  ];

  const teachers: Teacher[] = [
    { id: 't-ahmed', name: 'Ahmed Khan', email: 'ahmed@school.test', subjectIds: ['s-math'], needsCover: true },
    { id: 't-sara', name: 'Sara Malik', email: 'sara@school.test', subjectIds: ['s-eng', 's-math'], needsCover: true },
    { id: 't-omar', name: 'Omar Ali', email: 'omar@school.test', subjectIds: ['s-sci'], needsCover: true },
    { id: 't-fatima', name: 'Fatima Noor', email: 'fatima@school.test', subjectIds: ['s-hist'], needsCover: true },
  ];

  const monday = 1;
  const slots: TimetableSlot[] = [
    { id: uid(), dayOfWeek: monday, periodId: 'p1', classSectionId: 'c-7a', subjectId: 's-math', teacherId: 't-ahmed', room: 'R101' },
    { id: uid(), dayOfWeek: monday, periodId: 'p1', classSectionId: 'c-7b', subjectId: 's-eng', teacherId: 't-sara', room: 'R102' },
    { id: uid(), dayOfWeek: monday, periodId: 'p2', classSectionId: 'c-7a', subjectId: 's-eng', teacherId: 't-sara', room: 'R101' },
    { id: uid(), dayOfWeek: monday, periodId: 'p2', classSectionId: 'c-8a', subjectId: 's-math', teacherId: 't-ahmed', room: 'R201' },
    { id: uid(), dayOfWeek: monday, periodId: 'p3', classSectionId: 'c-7a', subjectId: 's-sci', teacherId: 't-omar', room: 'R101' },
    { id: uid(), dayOfWeek: monday, periodId: 'p3', classSectionId: 'c-7b', subjectId: 's-hist', teacherId: 't-fatima', room: 'R102' },
    { id: uid(), dayOfWeek: monday, periodId: 'p4', classSectionId: 'c-8a', subjectId: 's-sci', teacherId: 't-omar', room: 'R201' },
    { id: uid(), dayOfWeek: monday, periodId: 'p5', classSectionId: 'c-7a', subjectId: 's-hist', teacherId: 't-fatima', room: 'R101' },
    { id: uid(), dayOfWeek: 2, periodId: 'p1', classSectionId: 'c-8a', subjectId: 's-eng', teacherId: 't-sara', room: 'R201' },
    { id: uid(), dayOfWeek: 2, periodId: 'p1', classSectionId: 'c-7a', subjectId: 's-sci', teacherId: 't-omar', room: 'R101' },
    { id: uid(), dayOfWeek: 2, periodId: 'p2', classSectionId: 'c-7b', subjectId: 's-math', teacherId: 't-ahmed', room: 'R102' },
    { id: uid(), dayOfWeek: 2, periodId: 'p3', classSectionId: 'c-7a', subjectId: 's-math', teacherId: 't-ahmed', room: 'R101' },
  ];

  const absences: Absence[] = [];
  const arrangements: Arrangement[] = [];

  return { teachers, subjects, classSections, periods, slots, absences, arrangements };
}
