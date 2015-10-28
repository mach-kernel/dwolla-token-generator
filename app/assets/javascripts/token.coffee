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
  $('#all_scopes_button').click ->
    table = $('#scope_table')
    $('td input:checkbox', table).prop('checked', true)
    return
  $('#no_scopes_button').click ->
    table = $('#scope_table')
    $('td input:checkbox', table).prop('checked', false)
    return
  $('#again_button').click ->
    $('#token_box').fadeOut()
    return
  $('#button-sandbox').click ->
    $('#environment_toggle').val('sandbox')
    $(this).addClass('btn-warning')
    $('#button-production').removeClass('btn-success')
    return
  $('#button-production').click ->
    $('#environment_toggle').val('production')
    $(this).addClass('btn-success')
    $('#button-sandbox').removeClass('btn-warning')
    return
  $('#button-v2').click ->
    $(this).addClass('btn-primary')
    $('#button-v1').removeClass('btn-primary')
    $('.v1-only').hide();
    return
  $('#button-v1').click ->
    $(this).addClass('btn-primary')
    $('#button-v2').removeClass('btn-primary')
    $('.v1-only').show();
    return

  $('#button-v2').click();
  return