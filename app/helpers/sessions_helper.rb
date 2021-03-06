module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    @user = nil
    cookies.delete(:user_id)
  end
end
