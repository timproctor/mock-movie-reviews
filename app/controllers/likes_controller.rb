class LikesController < ApplicationController
  before_action :require_signin
  before_action :set_movie

  def create
    @movie.likes.create!(user: current_user)

    redirect_to @movie, notice: "Liked It Successfully"
  end

  def destroy
    liked = current_user.likes.find(params[:id])
    liked.destroy

    redirect_to @movie, notice: "Unliked Successfully"
  end

private

  def set_movie
    @movie = Movie.find_by!(slug: params[:movie_id])
  end
end
