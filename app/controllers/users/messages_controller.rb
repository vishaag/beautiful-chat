class Users::MessagesController < ApplicationController
  def index
    @recipient = User.find(params[:user_id])
    @old_messages = Message.messages_between([current_user.id, @recipient.id]).sort_by_created_at
    @message = current_user.sent_messages.new
  end

  def create
    @message = current_user.sent_messages.new(message_params.merge({
      receiver_id: params[:user_id],
    }))
    if @message.save
      redirect_to request.referrer
    else
      render 'index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
