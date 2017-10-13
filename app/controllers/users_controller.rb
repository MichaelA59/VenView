class UsersController < ApplicationController
  before_action :authorize_user, only: [:edit, :update, :show]
  before_action :authorize_admin, only: [:index, :destroy]
  def index
    @users = User.all
  end

  d
      @user.profile_pic_url = params[:user][:profile_pic_url]
    end

    if params["delete-avatar"] === "1"
      @user.profile_pic_url = ""
      @user.remove_avatar!
    end

    @user.skip_reconfirmation!
    if @user.save
      flash[:notice] = 'Success! Your profile has been updated.'
      redirect_to @user
    else
      @user.email = params[:user][:email]
      @user.profile_pic_url = params[:user][:profile_pic_url]
      @user.avatar = params[:user][:avatar]
      render :edit
    end
  end

  def destroy
    this_user = User.find(params[:id])
    this_user.destroy

    redirect_to users_path
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def authorize_admin
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
