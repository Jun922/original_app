class PersonalsController < ApplicationController
  def index
    @personals = Personal.order("created_at DESC")
  end

  def new
    @personal = Personal.new
  end

  def create
    @personal = Personal.new(personal_params)
    if @personal.save
      redirect_to personal_chats_path
    else
      render :new
    end
  end

  private
  
  def personal_params
    params.require(:personal).permit(user_ids:[])
  end

end
