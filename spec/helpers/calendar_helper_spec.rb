require 'spec_helper'
require_relative '../../lib/event_calendar/calendar'
require_relative '../../app/helpers/calendar_helper'

describe CalendarHelper do
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

  describe '' do
    subject { helper.wdays_row_for(calendar) }
    let(:calendar) { ::EventCalendar::Calendar.new }
    it { should have(7).items }
  end
end
