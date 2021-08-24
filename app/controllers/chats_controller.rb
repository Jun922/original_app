class ChatsController < ApplicationController
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @chat = Chat.new
    @personal = Personal.find(params[:room_id])
    @chats = @personal.chats.includes(:user)

    query = "SELECT * FROM rooms"
    @personals = Personal.find_by_sql(query)
  end

  def create
    @personal = Personal.find(params[:personal_id])
    @chat = @personal.chats.new(chat_params)
    if @chat.save
      redirect_to personal_chats_path(@personal)
    else
      @chats = @personal.chats.includes(:user)
      render :index
    end
  end

  private
  def chat_params
   params.require(:chat).permit(:content, :image).merge(user_id: current_user.id)
 end

 def contributor_confirmation
   @chat = Chat.find(params[:id])
   unless current_user == @chat.user
     redirect_to root_path
   end
 end
end
