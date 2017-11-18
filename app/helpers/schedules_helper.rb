module SchedulesHelper

  def find_schedule(schedules, weekday, serial_number)
    return nil if schedules.nil?
    schedules = schedules.where(weekday: weekday)
    return nil if schedules.blank?
    schedules.find { |s| s.serial_number == serial_number }
  end
end
