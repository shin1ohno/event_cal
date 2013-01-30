require 'event_cal'

class EventCal::Event
  attr_accessor :held_on, :name
  def initialize(date = Date.today)
    @held_on = date
  end

  def self.all
    []
  end

  def self.fetch_events(calendar)
    all.select do |event|
      (calendar.start_on .. calendar.end_on).include?(event.held_on)
    end
  end
end
