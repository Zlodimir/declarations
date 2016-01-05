$ ->
  if gon.session_id != $.cookie('declarations_session_id')
    $.cookie('declarations_session_id', gon.session_id, { expires: 365 })
    $.cookie('declarations_session_count', parseInt(($.cookie('declarations_session_count') || 0), 10) + 1, { expires: 365 })

  $.cookie('declarations_page_count', parseInt(($.cookie('declarations_page_count') || 0), 10) + 1)

  return if !Visibility.isSupported()
  return if $('#signup-form').length == 0
  return if $.cookie('declarations_signup') == 'true'

  minute = 60 * 1000

  $signup = $('#signup-form')

  showPopup = ->
    return if $.cookie('declarations_signup_shows') == 'true' || $.cookie('declarations_signup') == 'true'
    $.cookie('declarations_signup_shows', true)
    $signup.find('.heading').removeClass('hidden')
    $signup.find('.subheading').addClass('hidden')
    $signup.modal('show')

  Visibility.change (e, state) ->
    if state == 'visible'
      showPopup()

  #after 2 minute on a page
  Visibility.every 2 * minute, ->
    showPopup()

  #each 10 page
  if $.cookie('declarations_page_count') >= 10
    $.cookie('declarations_page_count', 1)
    showPopup()

  if $.cookie('declarations_session_count') == '2'
    setTimeout(
      ->
       showPopup()
      3000
    )
