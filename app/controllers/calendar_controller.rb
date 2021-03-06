class CalendarController < ApplicationController

  before_action :authenticate_user!

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.current
    @events_by_date = Event.all.group_by{|d| d.date.to_date.to_s}
  end
end
