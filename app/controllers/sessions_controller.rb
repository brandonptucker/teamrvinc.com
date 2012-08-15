class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      flash.now[:error] = "Invalid email/password combination."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end