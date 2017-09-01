class EventsController < ApplicationController

  def new
    @event = Event.new
    render 'addEvent'
  end

  def create
    event = Event.new event_params
    if event.save
      redirect_to show_profile_path session[:id]
    else
      redirect_to events_new_path
    end
  end

  private
    def event_params
      params.require(:event).permit(:place_id, :title, :description, :date)
    end
end
