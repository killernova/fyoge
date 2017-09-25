class HomeController < ApplicationController
  def index
    @today = Time.current
    type = params[:type].present? ? params[:type] : 'day'
    if type == 'week'
      start_at = params[:start_at].present? ? params[:start_at] : @today.beginning_of_week
      end_at = @today.end_of_week
    else
      start_at = params[:start_at].present? ? params[:start_at] : @today.beginning_of_week
      end_at = @today.end_of_day
    end
    @schedules = Schedule.where('start_at >=? and end_at < ?', start_at, end_at)
  end

end
