class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room2 = Room2.find(params[:room2_id])
    @messages = @room2.messages.includes(:user)
  end

  def create
    @room2 = Room2.find(params[:room2_id])
    @message = @room2.messages.new(message_params)
    if @message.save
      redirect_to room2_messages_path(@room2)
    else
      @messages = @room2.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
   params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
 end
end
