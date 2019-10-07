class MembersController < ApplicationController
    layout "layout_group"

    def show
        @group = Group.find_by(id: params[:group_id])
        @member = @group.users
    end

    def create
        @user = User.find_by(email: params[:members][:email])
        if @user
            @role = Role.new(role_params)
            @role.user_id = @user.id
            @role.roles = 3
            @role.status = 2
            @role.save
            flash[:success] = "Add member success" 
            @group = Group.find(id: params[:member][:group] )
            redirect_to group_path(@group)
        else
            flash[:danger] = "Email not ecist in system"
            redirect_to root_path
        end
    end

    private
    def role_params
      params.require(:members).permit :group
    end
end
