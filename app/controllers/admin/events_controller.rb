class Admin::EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def publish
    @event = Event.find(params[:id])
    @event.update(published: true)
    redirect_to admin_event_path(@event)
  end
  
  def unpublish
    @event = Event.find(params[:id])
    @event.update(published: false)
    redirect_to admin_event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path
  end
      
  private
    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_params
      params.require(:event).permit(:title, :description, :location, :start_time, :end_time)
    end  
end
