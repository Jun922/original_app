class MakersController < ApplicationController
  def index
    @makers = Maker.order("created_at DESC")
    @maker = Maker.new
  end

  def create
    @maker = Maker.new(maker_params)
    Maker.create(maker_params)
  end

  private

  def maker_params
    params.require(:maker).permit(:content, :image).merge(user_id: current_user.id, category_id: categories_url)
 end
end