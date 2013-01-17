require_relative 'event'

class EventCal::Calendar
  attr :start_on, :end_on

  def initialize(date = Date.today)
    @start_on = date.beginning_of_month.beginning_of_week(:sunday)
    @end_on = date.end_of_month.end_of_week(:sunday)
  end

  def fetch_events
    events = ::EventCal::Event.subclasses.map { |klass|
      klass.fetch_events(@start_on, @end_on)
      }.flatten
  end
end
