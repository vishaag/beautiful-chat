class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def show
    @users = GroupUser.all
  end

  def index
    @groups = Group.all
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



end
