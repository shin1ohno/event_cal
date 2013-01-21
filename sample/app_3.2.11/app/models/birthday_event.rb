require 'event_calendar/event'

class BirthdayEvent < ::EventCalendar::Event
  def self.all
    user = User.where(:user_name => 'shin1ohno').first_or_create
    user.update_attributes(:birth_day => Date.parse('1979-01-18'))

    events = []
    (user.birth_day.year .. Date.today.year + 10).each do |year|
      events << self.new(Date.parse("#{year}-#{user.birth_day.month}-#{user.birth_day.day}"))
    end

    events
  end
end
