class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.authenticate_user(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to user
    else
      flash.now[:alert] = "Invalid email or password. Try again."
      render :new
    end
  end

  def destroy
    current_user = session[:user_id]
    current_user = nil

    reset_session
    redirect_to root_url, notice: "You have successfully logged out."
  end
end
