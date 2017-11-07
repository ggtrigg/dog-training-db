class AttendeesController < ApplicationController
  def new
    # @attendee = @event.nil? ? Attendee.new : @event.attendee.build
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
 
    if @attendee.save
      redirect_to @attendee.event
    else
      render 'new'
    end
  end
  
  def edit
    @attendee = Attendee.find(params[:id])
  end

  def update
    @attendee = Attendee.find(params[:id])
    
    if @attendee.update(attendee_params)
      redirect_to @attendee.event
    else
      render 'edit'
    end
  end
  
  private
  def attendee_params
    params.require(:attendee).permit(:price, :attendee_status, :client_id, :client_ids => [])
  end
  
end
