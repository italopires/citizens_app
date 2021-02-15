$(document).ready(function () {
  Inputmask("date", { "placeholder": "dd/mm/aaaa",
    clearIncomplete: true, yearrange: { maxyear: 3000 } }).mask('.datepicker');

  Inputmask("(99)99999999", { clearIncomplete: true }).mask('.phone');
  Inputmask("999.999.999-99", { clearIncomplete: true }).mask('.cpf');
  Inputmask("99999-999", { clearIncomplete: true }).mask('.zipcode');
});
