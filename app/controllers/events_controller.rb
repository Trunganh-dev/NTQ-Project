class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  layout "layout_group"

  def index
        @group = Group.find_by(id: params[:group_id])
        @events = Event.where(group_id: @group.id)
        @eventsdone = Event.where('endDate <= ?',Time.now)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
      @event = Event.new(event_params)
      @event.save
      flash.now[:success] = "Create event successfully"
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
    params.require(:event).permit(:title, :something, :document, :speaker, :startDate, :color, :duration, :group_id)
  end

end
