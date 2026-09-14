/** Scroll an edit form into view under the sticky topbar and optionally focus a field. */
export function scrollToEditForm(formId: string, focusId?: string): void {
  const go = () => {
    const form = document.getElementById(formId);
    const headerOffset = 80;
    if (form) {
      const y = Math.max(0, form.getBoundingClientRect().top + window.scrollY - headerOffset);
      window.scrollTo({ top: y, left: 0, behavior: 'auto' });
      document.documentElement.scrollTop = y;
      document.body.scrollTop = y;
      form.classList.add('is-editing');
    } else {
      window.scrollTo({ top: 0, left: 0, behavior: 'auto' });
      document.documentElement.scrollTop = 0;
      document.body.scrollTop = 0;
    }
    if (focusId) {
      const input = document.getElementById(focusId) as HTMLInputElement | HTMLSelectElement | null;
      input?.focus({ preventScroll: true });
    }
  };
  setTimeout(go, 0);
  setTimeout(go, 150);
}
