class Season < ApplicationRecord
  has_many :course_times
  belongs_to :week_schedule
end
