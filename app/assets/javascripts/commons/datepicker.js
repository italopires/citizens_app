$(document).ready(function () {
  $('.datepicker').datepicker({
    language: 'pt-BR',
    autoclose: true,
    orientation: "bottom auto",
    endDate: new Date('3000-01-01')
  });

  Inputmask("date", { "placeholder": "dd/mm/aaaa",
    clearIncomplete: true, yearrange: { maxyear: 3000 } }).mask('.datepicker');
});
