class VenuesController < ApplicationController
  before_action :authorize_user, only: [:new, :create]
  before_action :authorize_admin, only: [:edit, :update, :destroy]

  def index
    @venues = Venue.order('name ASC')
  end

  def show
    @venue = Venue.find(params[:id])
    @reviews = @venue.reviews
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

  def edit
    @venue = Venue.find(params[:id])
    @state_collection = Venue::STATES
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(venue_params)
      redirect_to venue_path(@venue)
    else
      @state_collection = Venue::STATES
      render :edit
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(
      :name,
      :url,
      :address,
      :city,
      :state,
      :zip,
      :capacity
    )
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("NotFound")
    end
  end

  def authorize_admin
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
