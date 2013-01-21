require 'event_calendar/event'

class EventCalendar::Calendar
  attr_accessor :base_date, :start_on, :end_on, :events

  def initialize(date = Date.today)
    @base_date = date
    # TODO: use beginning_of_week(:sunday) after migrates to rails 3.2
    @start_on = date.beginning_of_month.beginning_of_week.advance(:days => -1)
    @end_on = date.end_of_month.end_of_week.advance(:days => -1)
    fetch_events
  end

  def dates
    (@start_on..@end_on).to_a
  end

  def fetch_events
    @events = ::EventCalendar::Event.subclasses.map { |klass|
      klass.fetch_events(self)
      }.flatten
  end

  def events_on(date)
    @events.select{ |event| event.held_on == date }
  end
end
