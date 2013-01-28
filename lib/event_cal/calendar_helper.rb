module ::EventCal::CalendarHelper
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
    events = calendar.events_on(date)
    classes << 'has_events' if events.present?
    events.map(&:class).uniq.each {|event_class| classes << event_class.to_s.underscore }
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
      { :partial => 'event_cal/calendar',
        :format => :html,
        :locals => { :calendar => calendar },
      }
    )
  end

  def render_event_details(events)
    render(
      { :partial => 'event_cal/event_details',
        :format => :html,
        :locals => { :events => events }
      }
    )
  end
end