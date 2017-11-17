class Season < ApplicationRecord
  has_many :course_times, dependent: :destroy
  has_many :week_schedule

  def create_course_time(course_times)
    course_times.each do |key, val|
      self.course_times << CourseTime.create(start_at: val[:start_at], end_at: val[:end_at], serial_number: key)
    end
  end
end
