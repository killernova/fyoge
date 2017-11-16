class WeekSchedule < ApplicationRecord
  has_many :day_schedules
  has_many :schedules, through: :day_schedules
  belongs_to :season
  before_create :set_week

  def create_data(start_date)
    old_week_schedule = WeekSchedule.find_by(start_at: start_date)
    return if old_week_schedule.nil?
    7.times do |day|
      old_day_schedule = old_week_schedule.day_schedules&.find_by(start_at: start_date + day.day)
      next if old_day_schedule.nil?
      day_schedule = day_schedules.find_by start_at: start_at + day.days
      (1..4).to_a.each do |sm|
        old_schedule = old_day_schedule&.schedules&.find_by(serial_number: sm)
        next if old_schedule.nil?
        schedule = day_schedule.schedules.find_by serial_number: sm
        schedule.update start_at: old_schedule.start_at + 7.days, end_at: old_schedule.end_at + 7.days,
            course_id: old_schedule.course_id, user_id: old_schedule.user_id
      end
    end
  end

  def create_blank_data
    7.times do |day|
      day_schedule = day_schedules.create start_at: start_at + day.days
      season = day_schedule.week_schedule.season
      1.upto(4) do |sm|
        course_time = season.course_times.find_by(serial_number: sm)
        start_at = Time.parse("#{day_schedule.start_at} #{course_time.start_at}")
        end_at = Time.parse("#{day_schedule.start_at} #{course_time.end_at}")
        day_schedule.schedules.create date: day_schedule.start_at.day, weekday: (day + 1), serial_number: sm,
            start_at: start_at, end_at: end_at
      end
    end
  end

  private

  def set_week
    self.week = start_at.cweek
  end
end
