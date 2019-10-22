class AttendancesController < ApplicationController
  layout "layout_group"

  def index
    @group = Group.find_by(id: params[:group_id]) 
    @contents = Content.where(group_id: @group.id)
  end

  def show
    @members = Attendance.where(content_id: params[:id])
    @content = Content.find_by(id: params[:id])
    @group = Group.find_by(id: params[:group_id])
  end

  def create
    params[:member].each do |key,value|
      check = params[:member][:"#{key}"][:check]
      @group = Group.find_by(id: params[:member][:"#{key}"][:group_id])
      value_user = params[:member][:"#{key}"][:user_id]
      value_content = params[:member][:"#{key}"][:content_id]
      value_note = params[:member][:"#{key}"][:note]
      @active = Attendance.where( user_id: value_user, content_id: value_content)
      if @active.blank?
        if check == "yes"
          @attendance = Attendance.new
          @attendance.user_id = value_user
          @attendance.content_id = value_content
          @attendance.note = value_note
          @attendance.save
        end
      else !@active.blank?
        if check == "yes"
          @active.update_all(user_id: value_user, content_id: value_content, note: value_note )
        else
          @active.first.destroy
        end
      end
    end
  flash[:success]  = "Update Attendance successfully"
  redirect_to @group
  end
  
end