class ChatsController < ApplicationController
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
     @chat = Chat.new
   end
 
   def create
    @chat = Chat.new(chats_params)
     if @chat.save
       redirect_to chats_path
     else
       render :index
     end
   end
 
   private
 
   def chats_params
    params.require(:chat).permit(:content, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @chat = Chat.find(params[:id])
    unless current_user == @chat.user
      redirect_to root_path
    end
  end
end
