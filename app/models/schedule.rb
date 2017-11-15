class Schedule < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :teacher, class_name: 'User', foreign_key: :user_id, optional: true
  belongs_to :day_schedule
  belongs_to :week_schedule, optional: true
  # validate :uniqueness_of_serial_number

  private

  def uniqueness_of_serial_number
    numbers = Schedule.where('start_at >= ? and end_at < ?',
                             start_at.beginning_of_day, start_at.end_of_day)
                      .pluck(:serial_number)
    return false if numbers.include?(serial_number)
    true
  end
end
