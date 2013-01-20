module ::EventCalendar::CalendarHelper
  def wday_class_for(date)
    case date.wday
    when 0
      'sunday'
    when 6
      'saturday'
    end
  end

  def hightlight_classes(date, calendar)
    classes = []
    classes << 'has_events' if calendar.events_on(date).present?
    classes
  end

  def wdays_row_for(calendar)
    (calendar.start_on .. calendar.start_on + 6.days).map do |date|
      l date, :format => :calendar_row
    end
  end

  def render_monthly(calendar)
    render(
      :partial => 'event_calendar/calendar',
      :format => :html,
      :locals => { :calendar => calendar },
    )
  end
end
