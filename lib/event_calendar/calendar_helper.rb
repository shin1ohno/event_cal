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

  def previous_month_path(calendar)
  end

  def next_month_path(calendar)
  end

  def today_path(calendar)
  end

  def render_monthly(calendar)
    render(
      { :partial => 'event_calendar/calendar',
        :format => :html,
        :locals => { :calendar => calendar },
      }
    )
  end

  def render_event_details(events)
    render(
      { :partial => 'event_calendar/event_details',
        :format => :html,
        :locals => { :events => events }
      }
    )
  end
end
