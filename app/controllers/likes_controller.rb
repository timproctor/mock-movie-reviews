class LikesController < ApplicationController
  before_action :require_signin

  def create
    @movie = Movie.find(params[:movie_id])
    @movie.likes.create!(user: current_user)

    redirect_to @movie, notice: "You liked it!"
  end

end
