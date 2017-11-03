class EventsController < ApplicationController
    def show
    @event = Event.find(params[:id])
  end
  
  def new
    if params[:client_id]
      @client = Client.find(params[:client_id])
      @attendee = @client.attendees.build
    else
      @event = Event.new
    end
  end
  
  def create
    @event = Event.new(event_params)
 
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  private
  def event_params
    params.require(:event).permit(:event_type, :location, :price, :date, :duration, :client_id)
  end
end
