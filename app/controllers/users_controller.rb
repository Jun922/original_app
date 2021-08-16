class UsersController < ApplicationController
  def show
    @user = User.new
    @user = User.find(params[:room_id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      root to: "users#show"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday, :introduction)
  end
end
