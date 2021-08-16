class MessagesController < ApplicationController
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
     @message = Message.new
     @room = Room.find(params[:room_id])
     @messages = @room.messages.includes(:user)

     query = "SELECT * FROM rooms"
     @rooms = Room.find_by_sql(query)
   end
 
   def create
     @room = Room.find(params[:room_id])
     @message = @room.messages.new(message_params)
     if @message.save
       redirect_to room_messages_path(@room)
     else
       @messages = @room.messages.includes(:user)
       render :index
     end
   end
 
   private
 
   def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    @message = Message.find(params[:id])
    unless current_user == @message.user
      redirect_to root_path
    end
  end
 end