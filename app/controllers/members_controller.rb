class MembersController < ApplicationController
    layout "layout_group"

    def index
        @group = Group.find_by(params[:group_id])
        @members = @group.users.includes(:roles).where("roles.roles = ?", "3").where("roles.status = ?", "1")
        @mentor  = @group.users.includes(:roles).where("roles.roles = ?", "2").where("roles.status = ?", "1")
        @captain = @group.users.includes(:roles).where("roles.roles = ?", "1").where("roles.status = ?", "1")
        if user_signed_in?
          @role_current_user = current_user.groups.where(id: params[:id]).includes(:roles).where("roles.roles = ?", "1")  
        end
    end

    def create
        @user = User.find_by(email: params[:member][:email])
        @user_in_group = User.groups.find_by(group_id: parmams[:member][:group_id])
        if @user
            if @user_in_group == []
                @role = Role.new(role_params)
                @role.user_id = @user.id
                @role.roles = 3
                @role.status = 1
                @role.save
                flash[:success] = "Add member success" 
                redirect_to root_path  
            else
                flash[:danger] = "Thành viên đã có trong group"
                redirect_to root_path   
            end
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
