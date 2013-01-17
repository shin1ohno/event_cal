class EventCal::Event
  attr :held_on
  def initialize(date = Date.today)
    @held_on = date
  end

  def self.all
    []
  end

  def self.fetch_events(start_on, end_on)
    all.select do |event|
      (start_on .. end_on).include?(event.held_on)
    end
  end
end
