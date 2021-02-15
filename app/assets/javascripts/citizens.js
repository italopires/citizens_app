$(document).ready(function() {
  $('#citizen_state_id').on('change', function () {
    var state_id = $(this).val();
    if (state_id != '') {
      $.ajax({
        type: 'GET',
        url: `/api/v1/states/${state_id}/cities/`,
        dataType: 'json',
        success: function (data) {
          city_field = $('#citizen_city_id')
          city_field.html('');

          $.each(data.cities, function () {
            city_field.append("<option value='" + this.id + "'>" + this.name + "</option>");
          })
        }
      })
    }
  })
})