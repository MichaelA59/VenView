class UsersController < ApplicationController

  def show
   @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.email = params[:user][:email]
    @user.avatar_url = params[:user][:avatar_url]

    if @user.save
      flash[:notice]='Success! Your profile has been updated.'
      redirect_to @user
    else
      @user.email = params[:user][:email]
      @user.avatar_url = params[:user][:avatar_url]
      render :edit
    end
  end

end
