class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def search
    @movie = Movie.find_by(title: params[:movie])
    if @movie
      redirect_to movie_path(@movie)
    else
      flash[:alert] = "This movie is not in YAMDb. Try again!"
      redirect_to root_path
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_from_params)
    if @movie.save
      flash[:notice] = 'Movie successfully added.'
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  private

  def movie_from_params
    params.require(:movie).permit(:title, :description)
  end

end
