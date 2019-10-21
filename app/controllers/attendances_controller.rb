class AttendancesController < ApplicationController
before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @group = Group.find_by(id: params[:group_id]) 
    @contents = Content.where(group_id: @group.id)
  end

  def show
    @members = Attendance.where(content_id: params[:id])
  end

  def create
    @group = Group.find_by(id: params[:group_id])
    if !params[:check].nil?
      params[:check].each do |key_check,value_check| 
        params[:user_id].each do |key_user, value_user|
          params[:note].each do |key_note, value_note|
            if value_check == "yes"
              if key_check == key_user 
                if key_check == key_note
                  @active = Attendance.where( user_id: value_user, content_id: params[:content_id])
                  if @active.blank?
                  @attendance = Attendance.new
                  @attendance.user_id = value_user 
                  @attendance.content_id = params[:content_id]
                  @attendance.note = value_note 
                  @attendance.save
                  end 
                end
              end    
            else value_check == ""
              if key_check == key_user 
                if key_check == key_note
                  @active = Attendance.where( user_id: value_user, content_id: params[:content_id])
                  if !@active.blank?
                    @active.first.destroy
                  end 
                end
              end    
            end
          end
        end
      end
      flash[:success]  = "Attendance successfully"
      redirect_to @group
    else 
      flash[:success]  = "Update Attendance successfully"
      redirect_to @group
    end
  end

private

  def set_attendance
      @attendance = Attendance.find(params[:id])
  end

  def attendance_params
       params.require(:content).permit(:title, :description, :level, :startDate, :endDate)
  end

end
