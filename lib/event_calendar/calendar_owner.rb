module ::EventCalendar::CalendarOwner
  def new_calendar(date = Date.today)
    calendar = ::EventCalendar::Calendar.new(date)
    calendar.owner = self
    calendar
  end
end
