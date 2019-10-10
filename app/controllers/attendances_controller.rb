class AttendancesController < ApplicationController
before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def new
    @attendance = Attendance.new
  end

  def edit
    respond_to do |format|
    format.html
    format.js
    end
  end

  def create
  end

private

  def set_attendance
      @attendance = Attendance.find(params[:id])
  end

  def attendance_params
       params.require(:content).permit(:title, :description, :level, :startDate, :endDate)
  end

end
