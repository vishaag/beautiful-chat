class MessagesController < ApplicationController
  def index
    @old_messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
