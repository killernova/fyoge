module Admin
  class SeasonsController < AdminController
    before_action :set_season, only: [:show, :edit, :update, :destroy]
    def show
      @course_times = @season.course_times.order(serial_number: :asc)
    end

    def index
      @seasons = Season.all
    end

    def new
      @season = Season.new
    end

    def create
      # TODO: should optimize these codes
      @season = Season.create(season_params)
      @season.create_course_time(params[:course_time])
      if @season
        redirect_to admin_seasons_path, notice: '新增时令成功'
      else
        render :new
      end
    end

    def edit
    end

    def update
    end

    def destroy
      @season.destroy
      redirect_to admin_seasons_path, notice: '删除成功'
    end

    private

    def set_season
      @season = Season.find params[:id]
    end

    def season_params
      params.require(:season).permit(:name)
    end
  end
end
