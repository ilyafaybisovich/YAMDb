class MoviesController < ApplicationController
  def index
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
end
