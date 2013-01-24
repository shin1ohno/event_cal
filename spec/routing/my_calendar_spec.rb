require "spec_helper"

describe "my_calendar resources" do
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
  end
end
