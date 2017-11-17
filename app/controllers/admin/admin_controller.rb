module Admin
  class AdminController < ApplicationController
    layout 'admin'
    include SessionsHelper
    before_action :authenticate_admin!

    private

    def authenticate_admin!
      unless current_user || current_user&.admin?
        return redirect_to admin_login_path
      end
    end
  end
end