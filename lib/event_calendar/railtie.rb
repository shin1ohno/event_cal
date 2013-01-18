require 'event_calendar/calendar_helper'

module EventCalendar
  class Railtie < ::Rails::Railtie
    initializer 'event_calendar.view_helpers' do
      ActionController::Base.send(:helper, ::EventCalendar::CalendarHelper)
      ActionController::Base.append_view_path(File.dirname(__FILE__) + "/../../app/views")
    end
  end

  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
