class ChatsController < ApplicationController
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @chat = Chat.new
    @room2 = Room2.find(params[:room2_id])
    @chats = @room2.chats.includes(:user)

    query = "SELECT * FROM room2s"
    @chats = Chat.find_by_sql(query)
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
   params.require(:chat).permit(:content).merge(user_id: current_user.id)
 end

 def contributor_confirmation
    @chat = Chat.find(params[:id])
    unless current_user == @chat.user
      redirect_to root_path
    end
  end
end