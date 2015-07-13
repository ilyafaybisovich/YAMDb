class MoviesController < ApplicationController
  def index
  end

  def search
    @movie = Movie.find_by(title: params[:movie])
    redirect_to movie_path(@movie)
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
