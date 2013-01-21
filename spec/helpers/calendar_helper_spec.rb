require 'spec_helper'
require_relative '../../lib/event_calendar/calendar'
require_relative '../../lib/event_calendar/calendar_helper'

describe ::EventCalendar::CalendarHelper do
  describe '#wday_class_for(date)' do
    subject { helper.wday_class_for(date) }
    let(:sunday) { Date.parse('2012-12-30') }
    let(:saturday) { Date.parse('2012-12-29') }
    let(:monday) { Date.parse('2013-01-01') }

    context 'sunday' do
      let(:date) { sunday }
      it { should == 'sunday' }
    end

    context 'saturday' do
      let(:date) { saturday }
      it { should == 'saturday' }
    end

    context 'monday' do
      let(:date) { monday }
      it { should be_nil }
    end
  end

  describe '#render_monthly' do
    subject { render_monthly(calendar) }
    let(:calendar) { ::EventCalendar::Calendar.new }
    it { should =~ /<div class='calendar monthly'>/ }
  end
end
