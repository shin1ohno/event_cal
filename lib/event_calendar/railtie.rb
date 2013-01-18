require 'event_calendar/calendar_helper'

module EventCalendar
  class Railtie < ::Rails::Railtie
    initializer 'event_calendar.view_helpers' do
      ActionController::Base.send(:helper, ::EventCalendar::CalendarHelper)
    end
  end

  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
