class SessionsController < ApplicationController
  def new

  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.authenticate_user(email, password)

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to user
    else
      flash.now[:alert] = "Invalid email or password. Try again."
      render :new
    end
  end
end
