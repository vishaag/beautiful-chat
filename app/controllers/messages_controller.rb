class MessagesController < ApplicationController
  def index
    @old_messages_sent = Message.where("sender_id = ? AND receiver_id = ?", session[:user_id], params[:id])
    @old_messages_received = Message.where("sender_id = ? AND receiver_id = ?", params[:id], session[:user_id])

    @old_messages = (@old_messages_sent + @old_messages_received).sort{|a,b| a.created_at <=> b.created_at}
    @message = Message.new

  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = session[:user_id]
    @message.receiver_id = params[:id]
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
