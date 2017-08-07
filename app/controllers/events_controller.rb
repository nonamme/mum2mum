class EventsController < ApplicationController

  def new
    @event = Event.new
    render 'addEvent'
  end

  def create
    Event.create event_params
  end

  private
    def event_params
      params.require(:event).permit(:place_id, :title, :description)
    end
end
