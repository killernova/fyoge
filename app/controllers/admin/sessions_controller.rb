module Admin
  class SessionsController < AdminController
    def new
      @user = User.new
    end
    def create
      @user = User.find_by(mobile: session_params[:mobile])
      return render 'create_failed' if @user.nil?
      if verify_password(@user)
        log_in @user
        remember(@user) if session_params[:remember_me] == '1'
        return render 'create_succeeded'
      end
      render 'create_failed'
    end

    def destroy
      logout
      redirect_to login_path
    end

    private

    def session_params
      params.require(:session).permit(:mobile, :password, :verification_code, :remember_me)
    end


    def verify_password(user)
      if user.authenticate(session_params[:password])
        true
      else
        user.errors.add(:password, '请输入正确的密码')
        false
      end
    end
  end
end

