class SessionsController < ApplicationController
  before_action :require_login, only: [:new]

  def new 
    render :new
  end

  def create
    @user = User.find_by_credentials(
      #debugger
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login_user!(@user)
    else
      render :new
    end
  end

  def destroy
    logout!()
    redirect_to new_session_url
  end
end