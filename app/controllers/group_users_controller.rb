class GroupUsersController < ApplicationController
    before_action :load_group_user, except: [:create]

    def create
        GroupUser.create(group_users_params.merge({
            group_id: params[:group_id],
        }))
    end

    def update
        @group_user.update_attributes(admin: params[:admin])
        redirect_to request.referrer
    end

    def destroy
        @group_user.destroy
    end


    private

    def load_group_user
        @group_user = GroupUser.where(id: params[:id], group_id: params[:group_id]).first
    end

        def group_users_params
            params.require(:group_user).permit(:user_id)
        end

end