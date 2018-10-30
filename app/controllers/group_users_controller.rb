class GroupUsersController < ApplicationController

    def create
        GroupUser.create(group_users_params.merge({
            group_id: params[:group_id]
        }))
    end

    private

        def group_users_params
            params.require(:group_user).permit(:user_id)
        end

end