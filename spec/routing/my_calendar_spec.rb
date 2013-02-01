require 'spec_helper'
require 'event_cal/calendar'

describe "my_calendar resources" do
  let(:date) { Date.today }
  let(:calendar) { EventCal::Calendar.new(date)}
  describe 'index' do
    it 'index is routable' do
      { get: my_calendar_index_path }.should be_routable
      { get: my_calendar_index_path }.should route_to(controller: 'my_calendar', action: 'index')
    end
  end

  describe 'show' do
    it '' do
      { get: '/my_calendar/2013/01/01' }.should route_to(
        controller: 'my_calendar',
        action: 'show',
        year: '2013',
        month: '01',
        date: '01',
      )
    end
    it '' do
      { get: my_calendar_path(calendar) }.should route_to(
        controller: 'my_calendar',
        action: 'show',
        year: date.year.to_s,
        month: date.month.to_s,
        date: date.day.to_s,
      )
    end
  end
end
