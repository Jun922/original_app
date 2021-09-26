class UsersController < ApplicationController
  before_action :move_to_root_path, only: [:index, :create]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to current_user_path
    else
      render :edit
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private
  def user_params
    params.require(:user).permit(:name, :birthday, :introduction)
  end

  def move_to_root_path
    @user = user.find(params[:id])
    if current_user.id == @user_id
      redirect_to root_path
    end
  end
end