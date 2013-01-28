require 'spec_helper'
require 'event_cal/calendar'

describe MyCalendarController do
  describe '#index' do
    before { get :index }
    let(:calendar) { ::EventCal::Calendar.new(Date.today) }
    it { response.should be_ok }
    it 'assigns calendar for today' do
      cal = assigns(:calendar)
      cal.start_on.should == calendar.start_on
      cal.end_on.should == calendar.end_on
    end
  end
end
