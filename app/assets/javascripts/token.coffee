# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#example_app_button').smoothScroll()
  $('#example_app_button a').click ->
    $.smoothScroll
      scrollTarget: link.hash
      speed: 200
    return
  $('#user_creds_button').click ->
    $('#user_creds').css('display', 'inline')
    $('#example_creds').css('display', 'none')
    return
  $('#back_creds_button').click ->
    $('#user_creds').css('display', 'none')
    $('#example_creds').css('display', 'inline')
    return
  $('#all_scopes_button').click ->
    table = $('#scope_table')
    $('td input:checkbox', table).prop('checked', true)
  $('#no_scopes_button').click ->
    table = $('#scope_table')
    $('td input:checkbox', table).prop('checked', false)
  return