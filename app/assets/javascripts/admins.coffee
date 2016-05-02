# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $('#submitBtn').click ->
    $('#updateForm').submit()
    return


  $('#query').on 'keypress', (e) ->
    code = if e.keyCode then e.keyCode else e.which
    if code == 13
      e.preventDefault()
      e.stopPropagation()
      $(this).closest('#query_form').submit()
      return

  # clear radio button
  $('.btn').click ->
    id = this.id
    $('#choose_' + id + '_1').prop 'checked', false
    $('#choose_' + id + '_0').prop 'checked', false
    return

return
