class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  layout "layout_group"
  def index
        @events = Event.all
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
    @event = Event.new(event_params)
    @event.save
    flash[:success] = "Create event success"
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
    #params[:endDate] = params[:startDate].to_datetime + params[:duration].to_number.minutes
    params.require(:event).permit(:title, :somting, :document, :speaker, :startDate, :endDate, :color, :duration)
  end
end
