class AttendeesController < ApplicationController

  before_action :authenticate_user!

  def new
    @attendee = Attendee.new
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
