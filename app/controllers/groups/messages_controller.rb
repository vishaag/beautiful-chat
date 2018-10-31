class Groups::MessagesController < ApplicationController
  before_action :correct_group_user

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

    def correct_group_user
      @group = Group.find(params[:group_id])
      user_exists_in_group = false
      @group.users.each do |g| 
        if g == current_user
          user_exists_in_group = true
        end
      end
      redirect_to(groups_path) unless user_exists_in_group
    end      


end