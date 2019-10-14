class RolesController < ApplicationController
  before_action :groups

  def setCaptain
    @captain_group = Role.where(roles: 1, group_id: params[:group_id]).first
    @member_update = Role.where(group_id: params[:group_id], user_id: params[:user_id] ).first
    ActiveRecord::Base.transaction do
      if @captain_group.nil?
        @member_update.update_attributes(roles: 1)
        redirect_to group_members_path(@groups)
      else
      @captain_group.update_attributes(roles: 3)
      @member_update.update_attributes(roles: 1)
      redirect_to group_members_path(@groups)
      end
    end
  end

  def setMentor
    @mentor_group = Role.where(roles: 2, group_id: params[:group_id]).first
    @member_update = Role.where(group_id: params[:group_id], user_id: params[:user_id] ).first
    ActiveRecord::Base.transaction do
      if @mentor_group.nil?
        @member_update.update_attributes(roles: 2)
        redirect_to group_members_path(@groups)
      else
      @mentor_group.update_attributes(roles: 3)
      @member_update.update_attributes(roles: 2)
      redirect_to group_members_path(@groups)
      end
    end
  end

  def destroyMentor
    @mentor = Role.where(roles: 2, group_id: params[:group_id]).first
    ActiveRecord::Base.transaction do
      @mentor.update_attributes(roles: 3)
      redirect_to group_members_path(@groups)
    end
  end

  def destroyMember
    @member = Role.where(group_id: params[:group_id], user_id: params[:user_id] ).first  
    ActiveRecord::Base.transaction do
      @member.destroy
      redirect_to group_members_path(@groups)
    end
  end
  private
  def group
    @groups = Group.find_by(params[:group_id])
  end

end
