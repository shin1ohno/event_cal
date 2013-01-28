require 'event_cal/calendar'
require 'order_event'
require 'birthday_event'

class MyCalendarController < ApplicationController
  def index
    @calendar = ::EventCal::Calendar.new(Date.today)
  end

  def show
    date = Date.parse("#{params[:year]}-#{params[:month]}-#{params[:date]}")
    @calendar = ::EventCal::Calendar.new(date)
  end
end
