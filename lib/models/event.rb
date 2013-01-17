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
end