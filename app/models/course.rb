class Course < ApplicationRecord
  has_many :schedules
  validates :cn_name, presence: true
end
