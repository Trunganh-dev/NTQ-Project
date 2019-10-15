class JoinGroupsController < ApplicationController

  def joinGroup
    @member =  Role.where(user_id: params[:user_id], group_id: params[:group_id ]).first
    @group  = Group.find_by(id: params[:group_id])
    if @member.blank?
      @member = Role.new
      @member.user_id = params[:user_id]
      @member.group_id = params[:group_id]
      @member.roles = 3
      @member.status = 2
      @member.save
      flash[:success] = "Add member to pending" 
      redirect_to group_path(@group) 
    end
  end

  def leaveGroup
    @member = Role.where(user_id: params[:user_id], group_id: params[:group_id ]).first
    @group  = Group.find_by(id: params[:group_id])
    @member.destroy
    redirect_to group_path(@group)
  end
end
