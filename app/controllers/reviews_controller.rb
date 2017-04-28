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
    @review.venue_name = @venue.name

    if @review.save
      twitter_message = "Come see our new review for #{@venue.name}!
       https://venview.herokuapp.com/venues/#{@venue.id}"
      $client.update(twitter_message)
      redirect_to venue_path(@venue)
    else
      @ratings_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @ratings_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
    @venue = @review.venue
  end

  def update
    @review = Review.find(params[:id])
    @venue = @review.venue
    if @review.update_attributes(review_params)
      redirect_to venue_path(@venue)
    else
      @ratings_collection = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @venue = @review.venue
    @review.destroy

    redirect_to venue_path(@venue)
  end

  private

  def review_params
    params.require(:review).permit(:title, :cost, :sound_quality, :parking, :body)
  end
end
