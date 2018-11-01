class GroupsController < ApplicationController
  before_action :load_group, only: [:show, :edit]
  before_action :authorize_admin, only: [:edit]

  def new
    @group = Group.new
  end

  def show
    @users = GroupUser.all
  end

  def index
    @groups = Group.all
  end

  def edit
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      admin = false
      group_id = @group.id
      user_id = session[:user_id]
      admin = true if @group.group_type == 'closed'
      GroupUser.create(user_id: user_id, group_id: group_id, admin: admin)
      
      flash[:success] = "Group created!"
    else
      render 'new'
    end
  end


  private

    def group_params
      params.require(:group).permit(:name, :group_type)
    end

    def load_group
      @group = Group.find(params[:id])
    end

    def authorize_admin
      @is_admin = current_user.is_admin?(@group)
    
      unless @is_admin
        redirect_to group_messages_path(@group)
        return
      end
    end
end
