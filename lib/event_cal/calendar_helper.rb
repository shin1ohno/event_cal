require 'event_cal'

module EventCal
  module CalendarHelper
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
      classes << 'today' if date == Date.today
      events = calendar.events_on(date)
      classes << 'has_events' if events.present?
      events.map(&:class).uniq.each {|event_class| classes << event_class.to_s.underscore }
      classes
    end

    def path_to_previous_month(calendar)
    end

    def path_to_next_month(calendar)
    end

    def path_to_today(calendar)
    end

    def render_monthly(calendar)
      render(
        { :partial => 'shared/event_cal/calendar',
          :format => :html,
          :locals => { :calendar => calendar },
        }
      )
    end

    def render_event_details(events)
      render(
        { :partial => 'shared/event_cal/event_details',
          :format => :html,
          :locals => { :events => events }
        }
      )
    end
  end
end
