(function () {
  'use strict';
  const fields = ['full_name', 'citizen_id', 'phone', 'exam_date'];
  function normalize(field, value) {
    value = String(value || '').trim();
    if (field === 'full_name') return value.replace(/\s+/gu, ' ');
    if (field === 'phone') return value.replace(/^(?:\+84|84)([0-9]{9,10})$/, '0$1');
    return value;
  }
  function errorFor(form, field) {
    const input = form.elements.namedItem(field);
    const raw = input.value;
    const value = normalize(field, raw);
    if (/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/.test(raw)) return 'Thông tin chứa ký tự không hợp lệ.';
    if (field === 'full_name' && ([...value].length < 2 || [...value].length > 120 || !/^[\p{L}\p{M} .'-]+$/u.test(value) || (value.match(/\p{L}/gu) || []).length < 2)) return 'Họ tên cần 2–120 ký tự, chỉ gồm chữ và dấu phân cách tên.';
    if (field === 'citizen_id' && !/^[0-9]{12}$/.test(value)) return 'Căn cước công dân phải gồm đúng 12 chữ số.';
    if (field === 'phone' && !/^(?:0[35789][0-9]{8}|02[0-9]{9})$/.test(value)) return 'Nhập số di động 10 số hoặc số cố định 11 số hợp lệ.';
    if (field === 'exam_date') {
      const date = new Date(value + 'T00:00:00Z');
      const today = form.dataset.bookingToday || window.homeBookingToday || input.min;
      const unchangedPast = form.dataset.originalDate && value === form.dataset.originalDate;
      if (!/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/.test(value) || Number.isNaN(date.getTime()) || date.toISOString().slice(0, 10) !== value || (!unchangedPast && value < today)) return 'Chọn ngày khám hợp lệ từ hôm nay trở đi.';
    }
    return '';
  }
  function showField(form, field, message) {
    const input = form.elements.namedItem(field);
    const error = document.getElementById(input.getAttribute('aria-describedby'));
    if (error) error.textContent = message || '';
    input.setAttribute('aria-invalid', message ? 'true' : 'false');
    input.classList.toggle('is-invalid', !!message);
    input.dataset.bookingTouched = 'true';
  }
  function errors(form) {
    return Object.fromEntries(fields.map(field => [field, errorFor(form, field)]).filter(([, message]) => message));
  }
  function init() {
    document.querySelectorAll('form[data-quick-appointment]').forEach(form => {
      fields.forEach(field => {
        const input = form.elements.namedItem(field);
        if (!input) return;
        const validate = () => showField(form, field, errorFor(form, field));
        input.addEventListener('blur', validate);
        input.addEventListener('change', validate);
        input.addEventListener('input', () => {
          if (input.dataset.bookingTouched || input.getAttribute('aria-invalid') === 'true') validate();
        });
      });
      form.addEventListener('reset', () => fields.forEach(field => {
        const input = form.elements.namedItem(field);
        showField(form, field, '');
        delete input.dataset.bookingTouched;
      }));
      if (form.id !== 'quick-booking-form') form.addEventListener('submit', event => {
        const invalid = errors(form);
        fields.forEach(field => showField(form, field, invalid[field]));
        if (Object.keys(invalid).length) {
          event.preventDefault();
          form.elements.namedItem(Object.keys(invalid)[0]).focus();
        }
      });
    });
  }
  window.QuickAppointmentValidation = { normalize, errors, showField };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
