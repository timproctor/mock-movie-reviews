class LikesController < ApplicationController
  before_action :require_signin

  def create
    @movie = Movie.find(params[:movie_id])
    @movie.likes.create!(user: current_user)

    redirect_to @movie, notice: "You liked it!"
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    liked = current_user.likes.find(params[:id])
    liked.destroy

    redirect_to @movie, notice: "Successfully unliked!"
  end
end
