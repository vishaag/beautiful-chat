class MessagesController < ApplicationController
  def index
    @old_messages = Message.messages_between([current_user.id, params[:id]]).sort_by_created_at
    @message = Message.new
  end

  def create
    @message = Message.new(message_params.merge({
      sender_id: current_user.id,
      receiver_id: params[:id],
    }))
    if @message.save
      redirect_to controller: 'messages', id: params[:id]
    else
      render 'index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
