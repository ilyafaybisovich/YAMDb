class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    movie = Movie.find(params[:movie_id])
    review = movie.reviews.new(review_from_params)
    redirect_to movie_path(params[:movie_id]) if review.save
  end

  private

  def review_from_params
    params.require(:review).permit(:thoughts, :rating).merge({user: current_user})
  end

end
