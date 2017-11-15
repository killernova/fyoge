class SchedulesController < ApplicationController
  before_action :set_date

  def week
    @week_start = @time.beginning_of_week
    @week_end = @time.end_of_week
    @schedules = Schedule.includes(:course).where('start_at >= ? and end_at < ?', @week_start,
                                                  @week_end)
                     .group_by {|s| s.weekday}
    @dates = %w(一 二 三 四 五 六 日)
  end

  def day
    @day_start = @time.beginning_of_day
    @day_end = @time.end_of_day
    @schedules = Schedule.includes(:course).where('start_at >= ? and end_at < ?', @day_start,
                                                  @day_end)
  end

  def new
    @schedule = Schedule.new
    @courses = Course.all
    @teachers = User.teachers
    @dates = { '一' => 1, '二' => 2, '三' => 3, '四' => 4, '五' => 5, '六' => 6, '七' => 7 }
  end

  def updates
    week_schedule = WeekSchedule.find params[:week_schedule_id]
    schedule = week_schedule.schedules.find_by(weekday: params[:weekday], serial_number: params[:serial_number])
    if schedule.update course_id: params[:course_id], user_id: params[:user_id]
      course = schedule.course
      return render json: { message: 'ok', cn_name: course.cn_name, en_name: course.en_name,
                            color: course.color, description: course.description, teacher: schedule.teacher.name }
    end
  end

  private

  def set_date
    @time = params[:time].present? ? (Time.parse(params[:time]) + 8.hours).utc : Time.current
  end
end
