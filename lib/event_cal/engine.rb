require 'event_cal/calendar_helper'

module EventCal
  module Rails
    class Engine < ::Rails::Engine
      initializer 'event_cal.setup_view_helpers' do |app|
        app.config.to_prepare do
          # after migrating to 3.2 a line below works
          # ActionController::Base.send(:helper, ::EventCal::CalendarHelper)
          ActionView::Base.send(:include, ::EventCal::CalendarHelper)
        end
      end
    end
  end
end
