class MakersController < ApplicationController
  def index
    @maker = Maker.new
  end

  def create
    @maker = Maker.find(params[:id])
    @maker = Maker.new(maker_params)
    if @maker.save
      redirect_to maker_path
    else
      render :index
    end
  end

  private
  def maker_params
   params.require(:maker).permit(:content, :image).merge(user_id: current_user.id, category_id: category.id)
 end
end