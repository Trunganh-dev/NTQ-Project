class MembersController < ApplicationController
  layout "layout_group"
  before_action :group
  before_action :role_current_user

  def index
      @members = @group.users.includes(:roles).where("roles.roles = ?", "3").where("roles.status = ?", "1")
      @mentor  = @group.users.includes(:roles).where("roles.roles = ?", "2").where("roles.status = ?", "1")
      @captain = @group.users.includes(:roles).where("roles.roles = ?", "1").where("roles.status = ?", "1")
  end

  def create
      @user = User.find_by(email: params[:member][:email])
      @user_in_group = @user.roles.where(group_id: params[:group_id]) if !@user.blank?
      if @user
          if @user_in_group == []
            if @role_current_user == []
              @role = Role.new(role_params)
              @role.user_id = @user.id
              @role.roles = 3
              @role.status = 2
              @role.save
              flash[:success] = "Add member success" 
              redirect_to group_members_path(@group) 
            else
              @role = Role.new(role_params)
              @role.user_id = @user.id
              @role.roles = 3
              @role.status = 1
              @role.save
              flash[:success] = "Add member success" 
              redirect_to group_members_path(@group) 
            end
          else
            flash[:danger] = "Thành viên đã có trong group"
            redirect_to group_members_path(@group)   
          end
      else
        flash[:danger] = "Email not exist in system"
        redirect_to group_members_path(@group) 
      end
  end

  private
  def role_params
    params.require(:member).permit :group_id
  end

  def group
    @group = Group.find_by(params[:group_id])
  end

  def role_current_user
    @role_current_user = current_user.groups.where(id: params[:id]).includes(:roles).where("roles.roles = ?", "1")  if user_signed_in?
  end
end
