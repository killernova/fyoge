$(document).on 'turbolinks:load', ->
  if $('#schedules-week').length
    $('.course').on 'click', ->
      path = $(this).data('path')
      Turbolinks.visit path