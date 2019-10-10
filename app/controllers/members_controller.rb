class MembersController < ApplicationController
    layout "layout_group"

    def show
        @group = Group.find_by(id: params[:group_id])
        @members = @group.users.includes(:roles).where("roles.roles = ?", "3").where("roles.status = ?", "1")
        @mentor  = @group.users.includes(:roles).where("roles.roles = ?", "2").where("roles.status = ?", "1")
        @captain = @group.users.includes(:roles).where("roles.roles = ?", "1").where("roles.status = ?", "1")
        if user_signed_in?
          @role_current_user = current_user.groups.where(id: params[:group_id]).includes(:roles).where("roles.roles = ?", "1")  
        end
    end

    def create
        @user = User.find_by(email: params[:member][:email])
        if @user
            @role = Role.new(role_params)
            @role.user_id = @user.id
            @role.roles = 3
            @role.status = 2
            @role.save
            flash[:success] = "Add member success" 
            redirect_to root_path
        else
            flash[:danger] = "Email not exist in system"
            redirect_to root_path
        end
    end

    private
    def role_params
      params.require(:member).permit :group_id
    end
end
