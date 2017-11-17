module Admin
  class UsersController < AdminController
    before_action :set_user, only: [:edit, :show, :destroy, :update]
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: '成功添加教师'
      else
        flash.now[:alert] = "操作失败：#{@user.errors}"
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: '成功更新教师'
      else
        flash.now[:alert] = "操作失败：#{@user.errors}"
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: '删除成功'
    end

    private

    def user_params
      params.require(:user).permit(:name, :mobile, :nick_name, :sex, :role_id)
    end

    def set_user
      @user = User.find params[:id]
    end
  end
end

