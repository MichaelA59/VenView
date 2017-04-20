class VenuesController < ApplicationController
  def index; end

  def show
    @venue = Venue.find(params[:id])
    @reviews = @venue.reviews
  end
end
