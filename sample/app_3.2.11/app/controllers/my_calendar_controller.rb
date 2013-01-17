require 'event_calendar/calendar'
require 'order_event'

class MyCalendarController < ApplicationController
  respond_to :html
  def index
    @calendar = ::EventCalendar::Calendar.new(Date.today)
    respond_with @calendar
  end
end
