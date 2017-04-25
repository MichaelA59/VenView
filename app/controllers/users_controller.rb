class UsersController < ApplicationController
  before_action :authorize_user, only: [:edit, :update, :show]
  before_action :authorize_admin, only: [:index]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.email = params[:user][:email]
    @user.avatar_url = params[:user][:avatar_url]

    if @user.save
      flash[:notice] = 'Success! Your profile has been updated.'
      redirect_to @user
    else
      @user.email = params[:user][:email]
      @user.avatar_url = params[:user][:avatar_url]
      render :edit
    end
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
