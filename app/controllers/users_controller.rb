class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy]
  def index
  end

  def show
  end

  def setting

  end


  private

  def set_user
    @user = User.find params[:id]
  end
end
