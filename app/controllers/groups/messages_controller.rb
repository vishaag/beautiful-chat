class Groups::MessagesController < ApplicationController

    def index
      @group = Group.find(params[:group_id])
      @old_messages = @group.group_messages
      @message = GroupMessage.new

    end
    
    def create
      @group = Group.find(params[:group_id])
      @group_message = @group.group_messages.new(message_params.merge({
        sender_id: current_user.id
      }))
      if @group_message.save
        redirect_to request.referrer
      else
        render 'index'
      end
    end
    
      private
    
    def message_params
        params.require(:group_message).permit(:content)
      end


end