class Admin::EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update ]
  
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
      redirect_to @event
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
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_params
      params.expect(event: [ :title, :description, :location ])
    end  
end
