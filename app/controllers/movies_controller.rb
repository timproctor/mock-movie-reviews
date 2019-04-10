class MoviesController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @movies = Movie.send(movie_scope)
    case params[:filter]
    when 'hits'
      @movies = Movie.hits
    when 'flops'
      @movies = Movie.flops
    when 'recent'
      @movies = Movie.recent
    when 'upcoming'
      @movies = Movie.upcoming
    else
      @movies = Movie.released
    end

  end

  def show
    @movie = Movie.find(params[:id])
    @fans = @movie.fans
    @genres = @movie.genres

    if current_user
      @currently_liked = current_user.likes.find_by(movie_id: @movie.id)
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new

  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url, alert: "Movie successfully deleted!"
  end

private

  def movie_params
    params.require(:movie).
      permit(:title, :description, :rating, :released_on, :total_gross,
             :cast, :director, :duration, :image_file_name, genre_ids: [])
  end

  def movie_scope
    params[:scope] if params[:scope].in? %w(flops hits recent upcoming)

    :released
  end

end
