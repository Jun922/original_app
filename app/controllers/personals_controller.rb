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
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @personal = Personal.find(params[:id])
  end

  private
  
  def personal_params
    params.require(:personal).merge(user_id: current_user.id)
  end

end
