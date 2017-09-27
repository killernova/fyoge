class Schedule < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validate :uniqueness_of_serial_number

  private

  def uniqueness_of_serial_number
    numbers = Schedule.where('start_at >= ? and end_at < ?',
                             start_at.beginning_of_day, start_at.end_of_day)
                      .pluck(:serial_number)
    return false if numbers.includes(serial_number)
    true
  end
end
