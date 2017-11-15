validateMobile = (mobile) ->
  result = { code: 'ok', message: '' }
  reg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/
  if !reg.test(mobile)
    result.code = 'error'
    result.message = '请输入有效的手机号码'
    return result
