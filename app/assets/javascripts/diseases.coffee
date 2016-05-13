# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->

  # clear radio button
  $('.btn_clear').click ->
    id = this.id
    $('#choose_' + id + '_1').prop 'checked', false
    $('#choose_' + id + '_0').prop 'checked', false
    $('#reason_' + id).val("0")
    $('#reason_' + id).prop 'disabled', true
    return

  $('#submit').click ->
    has_error = false

    $('.radio_input').each (i, obj) ->
      id = this.id
      disease_id = id.substring(7, id.length-2)
      reason_id = "reason_" + disease_id
      if id[id.length-1] == '0' && $(this).is(':checked') && $('#'+reason_id).val().length == 0
        alert("Please choose reason for unrelated relationships.")
        has_error = true
        return false; # break
      return

    if has_error == false
      $('#questions').submit()
    return

  # make the drop down list selectable
  $('.radio_input').click ->
    id = this.id
    disease_id = id.substring(7, id.length-2)
    if id[id.length-1] == '0'
      $('#reason_' + disease_id).prop 'disabled', false
    return

  return
