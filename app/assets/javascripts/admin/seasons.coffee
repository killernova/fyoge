$(document).on 'turbolinks:load', ->
  if $('#admin-seasons-index').length
    $('.content-cover').on 'click', hideElements
    $('.content-container').on 'click', hideElements

  if $('.admin-seasons').length
    $('.datetimepicker').datetimepicker({
      format: 'hh:ii',
      autoclose: true,
      minView: 'hour',
      startView: 'day'
    })



hideElements = ->
  $('.content-cover').hide()
  $('.content-container').hide()