$(document).on 'turbolinks:load', ->
  if $('.admin-sessions').length

    checkMobile = (obj) ->
      if obj.length < 1
        return true
      mobile = obj.val().trim()
      result = validateMobile(mobile)
      if result.code == 'error'
        obj.val('')
        displayError(obj, result.message)
        return false
      true

    $('.mobile-input').on 'change', ->
      clearError($(this))
      checkMobile($(this))

    checkPassword = (obj) ->
      if obj.length < 1
        return true
      pwd = obj.val().trim()
      if pwd.length < 6
        obj.val('')
        displayError(obj, '请输入正确的密码(至少6位)')
        return false
      true

    $('.password-input').on 'change', ->
      clearError($(this))
      checkPassword($(this))

    checkPasswordConfirmation = (pwdObj, pwdConfirmObj) ->
      if pwdConfirmObj.length < 1
        return true
      pwd = pwdObj.val().trim()
      pwdConfirm = pwdConfirmObj.val().trim()
      if pwd != pwdConfirm
        pwdConfirmObj.val('')
        displayError(pwdConfirmObj, '两次输入的密码不一致')
        return
      true

    $('.password-confirmation-input').on 'change', ->
      clearError($(this))
      pwdObj = $(this).parents('form').find('.password-input')
      checkPasswordConfirmation(pwdObj, $(this))

    checkVerificationCode = (obj) ->
      if obj.length < 1
        return true
      code = obj.val().trim()
      if code.length != 6
        obj.val('')
        displayError(obj, '请输入正确的验证码(6位)')
        return false
      true

    $('#session_verification_code').on 'change', ->
      clearError($(this))
      checkVerificationCode($(this))


    $('input[placeholder]').on 'keyup', ->
      clearError($(this))

    # Submit the form
    $('.submit-button').on 'click', (e) ->
      that = $(this)
      form = that.parents('form')

      # Check input value
      m = checkMobile(form.find('.mobile-input'))
      p = checkPassword(form.find('.password-input'))
      c = checkPasswordConfirmation(form.find('.password-input'), form.find('.password-confirmation-input'))
      v = checkVerificationCode(form.find('.verification-code-input'))
      if m && p && c && v
        form.find('.hidden-submit-button').click()

    # switch login box
    $('.switch-login').on 'click', ->
      box = $(this).parents('.login-box')
      box.fadeOut('slow', ->
        box.siblings('.login-box').fadeIn('slow')
      )

    # Switch to sign up
    $('.register').on 'click', ->
      box = $(this).parents('.login-box')
      box.fadeOut('slow', ->
        box.siblings('#register-box').fadeIn('slow')
      )

    # Switch to sign in
    $('.login-link').on 'click', ->
      box = $(this).parents('#register-box')
      box.fadeOut('slow', ->
        box.siblings('.login-box:first').fadeIn('slow')
      )

    # Send verification code
    $('.send-verification-code').on 'click', ->
      that = $(this)
      form = that.parents('form')

      # Check input value
      if checkMobile(form.find('.mobile-input'))
        mobile = form.find('.mobile-input').val().trim()
        sendCode(mobile)
        $(this).hide()
        countDown($('.count-down'), $(this), 60)

displayError = (obj, message) ->
  obj.parents('.form-item').addClass('form-item-error')
  obj.parents('.form-item').next().removeClass('hidden')
  obj.parents('.form-item').next().find('.error-message').text(message)

clearError = (obj) ->
  obj.parents('.form-item').removeClass('form-item-error')
  obj.parents('.form-item').next().addClass('hidden')
  obj.parents('.form-item').next().find('.error-message').text('')


