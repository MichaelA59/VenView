class VenuesController < ApplicationController

  def index
    @venues = Venue.order('name ASC')
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
    @state_collection = Venue::STATES
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      flash[:notice] = 'Venue added successfully!'
      redirect_to @venue
    else
      @state_collection = Venue::STATES
      render action: 'new'
    end
  end

  private
  def venue_params
    params.require(:venue).permit(:name, :url, :address, :city, :state, :zip, :capacity)
  end


end
