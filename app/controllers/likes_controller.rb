class LikesController < ApplicationController
  before_action :require_signin

  def create
    @movie = Movie.find(params[:movie_id])
    @movie.likes.create!(user: current_user)

    redirect_to @movie, notice: "You liked it!"
  end

  def show
    @movie = Movie.find(params[:id])
    @fans = @movie.fans

    if current_user
      @current_like = current_user.likes.find_by(movie_id: @movie.id)
    end
  end
end
