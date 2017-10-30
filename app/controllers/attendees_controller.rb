class AttendeesController < ApplicationController
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
    params.require(:attendee).permit(:price, :attendee_status)
  end
  
end
