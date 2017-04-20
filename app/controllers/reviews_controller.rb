class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
    @ratings_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @review = Review.new(review_params)
    @review.venue = @venue
    @review.user = current_user

    if @review.save
      redirect_to venue_path(@venue)
    else
      @ratings_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :cost, :sound_quality, :parking, :body)
  end
end
