class EventCal::Event
  attr :held_on
  def initialize(date)
    if date.class == Date
      base_date = date
    else
      base_date = Date.parse(date)
    end

    @held_on = base_date
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
