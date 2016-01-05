$ ->
  $signupForm = $('#remote-signup-form')
  $signinForm = $('#remote-signin-form')
  $forgotPasswordLink = $('.forgot-password-link')
  $forgotPasswordForm = $('#remote-forgot-password-form')
  $forgotPasswordModal = $('#forgot-password-form')
  $signupModal = $('#signup-form')
  $signinModal = $('#signin-form')

  parseErrors = (xhr) ->
    errors = if xhr.responseJSON['error']
      "<div class='warning'> #{xhr.responseJSON['error']} </div>"
    else if xhr.responseJSON['errors']
      $.map(xhr.responseJSON["errors"], (v, k) ->
        "<div class='warning'>#{k} #{v}</div>"
      ).join ''

  redirectToRoot = ->
    window.location.href = '/'

  showModal = ($modal) ->
    $modal.modal('show')

  $('#signup-form').on 'hide.bs.modal', (e) ->
    $('#signup-form').find('.heading').addClass('hidden')

  $('#signin-form').on 'hide.bs.modal', (e) ->
    $('#signin-form').find('.heading').addClass('hidden')

  $signupForm.on 'ajax:error', (event, xhr, settings, exceptions) ->
    $('#signup-form').find('.warning-wrapper').html(parseErrors(xhr))

  $signupForm.on 'ajax:success', (event, xhr, settings) ->
    $.cookie('declarations_signup', true, { expires: 365 })
    redirectToRoot()

  $signinForm.on 'ajax:error', (event, xhr, settings, exceptions) ->
    if xhr['status'] == 200
      redirectToRoot()
    else
      $('#signin-form').find('.warning-wrapper').html(parseErrors(xhr))

  $signinForm.on 'ajax:success', (event, xhr, settings) ->
    $.cookie('declarations_signup', true, { expires: 365 })
    redirectToRoot()

  $forgotPasswordLink.on 'click', (e) ->
    e.preventDefault()
    $signinModal.modal('hide')
    showModal($forgotPasswordModal)

  $forgotPasswordForm.on 'ajax:error', (event, xhr, settings, exceptions) ->
    $('#forgot-password-form').find('.warning-wrapper').html(parseErrors(xhr))

  $forgotPasswordForm.on 'ajax:success', (event, xhr, settings) ->
    $forgotPasswordModal.modal('hide')
    $signinModal.modal('show')
    $signinModal.find('.heading').removeClass('hidden')
    $signinModal.find('.forgot-password').hide()

