require 'event_cal/event'

class EventCal::Calendar
  attr_accessor :base_date, :start_on, :end_on, :events, :owner, :priority_events, :only_events, :except_events

  def initialize(date = Date.today, options = {} )
    parse_initializer_arguments(date, options)
    # TODO: use beginning_of_week(:sunday) after migrates to rails 3.2
    @start_on = @base_date.beginning_of_month.beginning_of_week.advance(:days => -1)
    @end_on = @base_date.end_of_month.end_of_week.advance(:days => -1)

    if @start_on <= @base_date.beginning_of_month - 7.day
      @start_on = @base_date.beginning_of_month
    end

    if @end_on < @base_date.end_of_month
      @end_on = @base_date.end_of_month.end_of_week.advance(:days => 6)
    end

    fetch_events
  end

  def dates
    (@start_on..@end_on).to_a
  end

  def fetch_events

    subclasses = if @only_events.present?
      if @priority_events.present?
        @priority_events & @only_events
      else
        @only_events
      end
    elsif @except_events.present?
      (@priority_events | ::EventCal::Event.subclasses) - @except_events
    else
      @priority_events | ::EventCal::Event.subclasses
    end

    @events = subclasses.map { |klass|
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
      case key
      when :owner
        @owner = value
      when :priority_events
        @priority_events = value
      when :only_events
        @only_events = value
      when :except_events
        @except_events = value
      end
    end

    if  @only_events.present? & @except_events.present?
      raise ArgumentError.new("initializing EventCal::Calendar : you passed :only_events and :except_events at once !")
    end

    @priority_events = [] if @priority_events.nil?
    @only_events = [] if @only_events.nil?
    @except_events = [] if @except_events.nil?
  end
end
