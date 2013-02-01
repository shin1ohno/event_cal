require 'event_cal/event'

class EventCal::Calendar
  attr_accessor :base_date, :start_on, :end_on, :events, :owner

  def initialize(date = Date.today, options = {} )
    parse_initializer_arguments(date, options)
    # TODO: use beginning_of_week(:sunday) after migrates to rails 3.2
    @start_on = @base_date.beginning_of_month.beginning_of_week.advance(:days => -1)
    @end_on = @base_date.end_of_month.end_of_week.advance(:days => -1)

    fetch_events
  end

  def dates
    (@start_on..@end_on).to_a
  end

  def fetch_events
    @events = ::EventCal::Event.subclasses.map { |klass|
      klass.fetch_events(self)
      }.flatten
  end

  def events_on(date)
    @events.select{ |event| event.held_on == date }
  end

  def to_param
    "#{base_date.year}/#{base_date.month}/#{base_date.day}"
  end

  private

  def parse_initializer_arguments(date, options)
    if date.class == Date
      @base_date = date
      opts = options
    elsif date.class == Hash
      @base_date = Date.today
      opts = date
    else
      raise ArgumentError.new('wrong argument for initializer')
    end

    opts.each do |key, value|
      if key == :owner
        @owner = value
      else
        #ignore other keys
      end
    end
  end
end
