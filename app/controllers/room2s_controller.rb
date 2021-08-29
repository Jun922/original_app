class Room2sController < ApplicationController
  def index
  end

  def new
    @room2 = Room2.new
  end

  def create
    @room2 = Room2.new(room2_params)
    if @room2.save
      redirect_to room2s_path
    else
      render :new
    end
  end

  def destroy
    room2 = Room2.find(params[:id])
    room2.destroy
    redirect_to room2s_path
  end

  private
  def room2_params
    params.require(:room2).permit(:name, user_ids:[]).merge(user_id: current_user.id)
  end
end
