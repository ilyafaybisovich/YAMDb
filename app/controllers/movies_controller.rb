class MoviesController < ApplicationController
  def index
  end

  def search
    p params
    @movie = Movie.find_by(title: params[:movie])
    p @movie
    redirect_to movie_path(@movie)
  end
end
