$(document).on 'turbolinks:load', ->
  if $('#schedules-week').length
    $('.course').on 'click', ->
      path = $(this).data('path')
      Turbolinks.visit path

  if $('#schedules-index').length
    $('.has-course').on 'click', ->
      path = '/schedules/' + $(this).data('schedule-id')
      Turbolinks.visit path

  if $('#schedules-show').length
    $('.appointment').on 'click', ->
      bootbox.alert('很抱歉，该功能暂时还未开放，敬请期待...')

    $('.back').on 'click', ->
      history.back()


#  if $('#schedules-new').length
#    $( "#schedule-date" ).date('jtsage-datebox')