class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.authenticate_user(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to(session[:intended_url] || user)
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid email or password. Try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You did it! You signed out."
  end
end
