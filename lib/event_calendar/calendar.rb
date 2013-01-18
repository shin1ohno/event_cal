require 'event_calendar/event'

class EventCalendar::Calendar
  attr :start_on, :end_on, :events

  def initialize(date = Date.today)
    @start_on = date.beginning_of_month.beginning_of_week(:sunday)
    @end_on = date.end_of_month.end_of_week(:sunday)
    fetch_events
  end

  def fetch_events
    @events = ::EventCalendar::Event.subclasses.map { |klass|
      klass.fetch_events(@start_on, @end_on)
      }.flatten
  end

  def events_on(date)
    @events.select{ |event| event.held_on == date }
  end
end
