class EventsController < ApplicationController
  def index
    @events = Event.current.by_start_time
  end

  def show
     @event = Event.find(params[:id])
  end
end
