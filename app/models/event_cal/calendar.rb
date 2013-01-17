require_relative 'event'

class EventCal::Calendar
  attr :start_on, :end_on

  def initialize(date)
    if date.class == Date
      base_date = date
    else
      base_date = Date.parse(date)
    end

    @start_on = base_date.beginning_of_month.beginning_of_week(:sunday)
    @end_on = base_date.end_of_month.end_of_week(:sunday)
  end

  def fetch_events
    events = ::EventCal::Event.subclasses.map { |klass|
      klass.fetch_events(@start_on, @end_on)
      }.flatten
  end
end
