class DaySchedule < ApplicationRecord
  has_many :schedules
  belongs_to :week_schedule
end
