module SchedulesHelper

  def find_schedule(schedules, key, index)
    return nil if schedules.nil?
    schedules = schedules.where(weekday: key)
    return nil if schedules.blank?
    schedules.find { |s| s.serial_number == index }
  end
end
