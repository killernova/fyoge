module SchedulesHelper

  def find_course_from_schedule(schedules, key, index)
    schedules = schedules.fetch(key) { [] }
    return nil if schedules.blank?
    schedules.find { |s| s.serial_number == index }&.course
  end
end
