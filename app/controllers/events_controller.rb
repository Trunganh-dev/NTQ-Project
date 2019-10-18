class EventsController < ApplicationController
  before_action :load_event, only: [:show, :edit, :update, :destroy]
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
    @event = Event.new (event_params)
    @event.save
    redirect_to @event
  end

  def update
    @event.update_attributes (event_params)
  end

  def destroy
    @event.destroy
  end

  private
  def load_event
    @event = Event.find_by id: params[:id]
  end

  def event_params
    params.require(:event).permit(:title, :startDate, :endDate, :color)
  end
end
