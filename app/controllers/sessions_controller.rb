class SessionsController < ApplicationController
  def new
    @session = User.new
  end

  def create
    user = User.find_by(user_name: session_params[:user_name])
    unless user
      return redirect_to login_path, alert: '该用户不存在'
    end
    if user.authenticate(session_params[:password])
      log_in user
      return redirect_to root_path
    else
      redirect_to login_path, alert: '用户名或者密码错误'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  private

  def session_params
    params.require(:user).permit(:password, :user_name)
  end
end
