class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      redirect_to user_path(current_user)
    else
      redirect_to new_course_path, alert: @course.errors
    end
  end

  private

  def course_params
    params.require(:course).permit(:en_name, :cn_name, :description, :color)
  end
end
