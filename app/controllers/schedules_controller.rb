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

  private

  def set_date
    @time = params[:time].present? ? (Time.parse(params[:time]) + 8.hours).utc : Time.current
  end
end
