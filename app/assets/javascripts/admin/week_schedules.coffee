$(document).on 'turbolinks:load', ->

  if $('#admin-week_schedules-index').length

    $('.add-new-week-schedule').on 'click', (e) ->
      e.preventDefault()
      dialog = bootbox.dialog(
        message: 'a'
        title: '请选择课程表时令与日期'
      )
      dialog.init ->
        $('.bootbox-body').empty()
        $('.bootbox-body').append($('.options').html())
        $('.bootbox-body .new-schedule-date').datetimepicker({
          format: 'yyyy-mm-dd',
          autoclose: true,
          minView: 'month',
          startDate: new Date(),
          endDate: null
        })

        $('.bootbox-body .old-schedule-date').datetimepicker({
          format: 'yyyy-mm-dd',
          autoclose: true,
          minView: 'month',
          startDate: null,
          endDate: null
        })

      $('body').on 'click', '.confirm-button', ->
        season_id = $(this).parents('.bootbox-body').find('#season').val()
        time = $(this).parents('.bootbox-body').find('.new-schedule-date').val().trim()
        moduleTime = $(this).parents('.bootbox-body').find('.old-schedule-date').val().trim()
        url = '/admin/week_schedules/new?season_id=' + season_id + '&time=' + time + '&module_time=' + moduleTime
        location.href = url

      $('body').on 'click', '.cancel-button', ->
        dialog.modal('hide')

  if $('#admin-week_schedules-edit').length
    $('.schedule-table .course').on 'click', ->
      that = $(this)
      scheduleId = that.attr('data-schedule-id')
      csrf = $('meta[name="csrf-token"]').attr('content')
      dialog = bootbox.dialog(
        message: 'a'
        title: '请选择课程与授课教师'
      )
      dialog.init ->
        $('.bootbox-body').empty()
        $('.bootbox-body').append($('.options').html())

      $('body').off('click', '.destroy-button')


      $('body').one 'click', '.confirm-button', ->
        courseId = $(this).parents('.bootbox-body').find('#course_id').val()
        userId = $(this).parents('.bootbox-body').find('#user_id').val()
        weekScheduleId = $('.schedule-table').data('week-schedule-id')
        weekday = that.data('weekday')
        serialNumber = that.data('serial-number')
        url = '/schedules/updates'
        $.ajax(
          url: url
          method: 'post'
          headers: { 'X-CSRF-Token': csrf }
          data:
            course_id: courseId
            user_id: userId
            week_schedule_id: weekScheduleId
            weekday: weekday
            serial_number: serialNumber
          success: (d) ->
            if d.message == 'ok'
              that.css({backgroundColor: d.color})
              that.find('.cn-name').text(d.cn_name)
              that.find('.en-name').text(d.en_name)
              that.find('.description').text("(" + d.description + ")")
              that.find('.teacher').text(d.teacher)
              dialog.modal('hide')
            else
              console.log(d.errors)
        )

      $('body').one 'click', '.cancel-button', ->
        dialog.modal('hide')

      $('body').on 'click', '.destroy-button', ->
        if scheduleId == ''
          dialog.modal('hide')
          return
        url = '/schedules/' +  scheduleId + '/clear'
        $.ajax(
          url: url
          method: 'post'
          headers: { 'X-CSRF-Token': csrf }
          data: {}
          success: (d) ->
            if d.message == 'ok'
              Turbolinks.visit location.href
            else
              console.log(d.errors)
        )


