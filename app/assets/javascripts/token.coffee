# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#all_scopes_button').click ->
    list = $('#scopes-list')
    $('input:checkbox', list).prop('checked', true)
    return
  $('#no_scopes_button').click ->
    list = $('#scopes-list')
    $('input:checkbox', list).prop('checked', false)
    return
  $('#again_button').click ->
    $('#token_box').fadeOut()
    return
  $('#button-sandbox').click ->
    $('#environment_toggle').val('sandbox')
    $(this).addClass('active')
    $('#button-production').removeClass('active')
    return
  $('#button-production').click ->
    $('#environment_toggle').val('production')
    $(this).addClass('active')
    $('#button-sandbox').removeClass('active')
    return
  $('#button-v2').click ->
    $(this).addClass('active')
    $('#button-v1').removeClass('active')
    $('.v1-only').hide();
    $('.v2-only').show();
    return
  $('#button-v1').click ->
    $(this).addClass('active')
    $('#button-v2').removeClass('active')
    $('.v1-only').show();
    $('.v2-only').hide();
    return

  saveCreds = () -> 
    localStorage.setItem('app_key', $('#auth_user_key').val())
    localStorage.setItem('app_secret', $('#auth_user_secret').val())

  retrieveCreds = () ->
    $('#auth_user_key').val(localStorage.getItem('app_key'))
    $('#auth_user_secret').val(localStorage.getItem('app_secret')) 

  $('#generic-credentials-checkbox').change ->
    if $(this).is(':checked')
      saveCreds()
      $('#custom-credentials-section').slideUp();
      $('#auth_user_key').val('')
      $('#auth_user_secret').val('')
      
    else
      retrieveCreds()
      $('#custom-credentials-section').slideDown();

  $('#submit').click -> 
    if $('#auth_user_key').val().length != 0 && $('#auth_user_secret').val().length != 0
      saveCreds()

  init = () ->
    $('#button-sandbox').click()
    $('#button-v2').click()
    retrieveCreds()

  init()
  return