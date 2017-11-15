// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require turbolinks
//= require bootstrap-sprockets
//= require bootbox.min
//= require bootstrap-datetimepicker.min
//= require common
//= require_tree .

function validateMobile(mobile) {
    var result = { code: 'ok', message: '' }
    var reg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/
    if(!reg.test(mobile)) {
        result.code = 'error'
        result.message = '请输入有效的手机号码'
    }
    return result
}

