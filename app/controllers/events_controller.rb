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
  
  def update
    # byebug
    @event = Event.find(params[:id])
    if @event.update(event_params)
      #~ @event.attendees.where.not(:client_id => nil).each do |a| a.update!(:client_id => a.id) end
      redirect_to @event
    else
      render 'show'
    end
  end

  private
  def event_params
    params.require(:event).permit(:event_type, :location, :price, :date, :duration, client_ids: []) 
  end
end
