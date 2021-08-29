class ChatsController < ApplicationController
  def index
    @chat = Chat.new
    @room2 = Room2.find(params[:room2_id])
    @chats = @room2.chats.includes(:user)
  end

  def create
    @room2 = Room2.find(params[:room2_id])
    @chat = @room2.chats.new(chat_params)
    if @chat.save
      redirect_to room2_chats_path(@room2)
    else
      @chats = @room2.chats.includes(:user)
      render :index
    end
  end

  private

  def chat_params
   params.require(:chat).permit(:content, :image).merge(user_id: current_user.id)
 end
end