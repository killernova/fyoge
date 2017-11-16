$(document).on 'turbolinks:load', ->
  if $('#admin-courses-new').length
    $('#new_course').validate()

  if $('#admin-courses-edit').length
    $('#new_course').validate()