module Admin
  class CoursesController < AdminController
    before_action :set_course, only: [:edit, :destroy, :update]
    def index
      @courses = Course.all
    end

    def new
      @course = Course.new
    end

    def create
      @course = Course.new(course_params)
      if @course.save
        redirect_to admin_courses_path, notice: '成功添加课程'
      else
        flash.now[:alert] = "操作失败：#{@course.errors}"
        render :new
      end
    end

    def edit
    end

    def update
      if @course.update(course_params)
        redirect_to admin_courses_path, notice: '成功更新课程'
      else
        flash.now[:alert] = "操作失败：#{@course.errors}"
        render :edit
      end
    end

    def destroy
      @course.destroy
      redirect_to admin_courses_path, notice: '删除成功'
    end

    private

    def course_params
      params.require(:course).permit(:cn_name, :en_name, :description, :color)
    end

    def set_course
      @course = Course.find params[:id]
    end
  end
end

