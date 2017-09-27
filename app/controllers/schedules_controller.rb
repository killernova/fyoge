class SchedulesController < ApplicationController
  def week
    @time = params[:time].present? ? (Time.parse(params[:time]) + 8.hours).utc : Time.current
    @week_start = @time.beginning_of_week
    @week_end = @time.end_of_week
    puts @week_start, Time.current.beginning_of_week
    puts @week_end, Time.current.end_of_week
    @schedules = Schedule.includes(:course).where('start_at >= ? and end_at < ?', @week_start,
                                @week_end)
                         .group_by { |s| s.weekday }
    @dates = %w(一 二 三 四 五 六 日)
  end

  def day
  end
end
