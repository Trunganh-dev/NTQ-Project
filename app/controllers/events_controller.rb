class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  layout "layout_group"


  def index
        @events = Event.where('endDate >= ?',Time.now)
        @eventsdone = Event.where('endDate <= ?',Time.now)
        @group = Group.find_by(id: params[:group_id])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    #if !Role.where(user_id: current_user.id, group_id: @group.id, roles: 1).blank?
      @event = Event.new(event_params)
      @event.save
      flash.now[:success] = "Create event successfully"
    #else
      #flash.now[:danger] = "Bạn không có quyền tạo event"
      #redirect_to root_path
    #end
  end

  def update
    @event.update(event_params)
  end


  def destroy
    @event.destroy
  end

  private

  def set_event
      @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :something, :document, :speaker, :startDate, :color, :duration)
  end

end
