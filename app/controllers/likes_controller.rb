class LikesController < ApplicationController
  before_action :require_signin

  def create
    @movie = Movie.find(params[:movie_id])
    if current_user
      @movie.likes.create!(user: current_user)
    end
    redirect_to @movie, notice: "You liked it!"
  end
end
