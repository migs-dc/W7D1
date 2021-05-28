class UsersController < ApplicationController
  before_action :require_login, only: [:new]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    # debugger
    if @user.save!
      login!(@user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
    #:session_token, :password_digest
  end
end