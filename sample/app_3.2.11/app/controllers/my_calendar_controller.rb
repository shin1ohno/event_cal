require 'event_calendar/calendar'
require 'order_event'
require 'birthday_event'

class MyCalendarController < ApplicationController
  def index
    @calendar = ::EventCalendar::Calendar.new(Date.today)
  end

  def show
    date = Date.parse("#{params[:year]}-#{params[:month]}-#{params[:date]}")
    @calendar = ::EventCalendar::Calendar.new(date)
  end
end
