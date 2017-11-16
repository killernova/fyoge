module Admin
  class WeekSchedulesController < AdminController
    before_action :set_date, except: [:new]
    def new
      time = params[:time].present? ? (Time.parse(params[:time]) + 8.hours).utc : Time.current
      module_time = params[:module_time].present? ? (Time.parse(params[:module_time]) + 8.hours).utc : nil
      @week_start = time.beginning_of_week
      @week_end = time.end_of_week
      @schedule = WeekSchedule.find_or_initialize_by(start_at: @week_start.strftime('%F'))
      if @schedule.new_record?
        return redirect_to admin_week_schedules_path if params[:season_id].blank?
        @schedule.season_id = params[:season_id]
        @schedule.save
        @schedule.create_blank_data
        @schedule.create_data(module_time.beginning_of_week) if module_time.present?
      end

      redirect_to edit_admin_week_schedule_path(@schedule)
    end

    def create
    end

    def edit
      @schedule = WeekSchedule.find params[:id]
      @week_start = @schedule.start_at
      @week_end = @week_start + 7.days
      @schedules = @schedule&.schedules&.includes(:course, :teacher)
      @dates = %w(一 二 三 四 五 六 日)
    end

    def update
    end

    def destroy
    end

    def index
      @week_start = @time.beginning_of_week
      @week_end = @time.end_of_week
      @schedule = WeekSchedule.find_by(start_at: @week_start.strftime('%F'))
      @schedules = @schedule&.schedules&.includes(:course)
      @dates = %w(一 二 三 四 五 六 日)
    end

    private

    def set_date
      @time = params[:time].present? ? (Time.parse(params[:time]) + 8.hours).utc : Time.current
    end
  end
end

