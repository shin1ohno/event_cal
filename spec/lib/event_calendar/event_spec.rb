require 'spec_helper'
require_relative '../../../lib/event_calendar/calendar'

require 'active_support/core_ext'

describe ::EventCalendar::Event do
  let(:event) { ::EventCalendar::Event.new(Date.parse('2013-01-01')) }

  describe '#held_on' do
    subject { event.held_on }
    it { should == Date.parse('2013-01-01') }
  end

  describe '.all' do
    subject { ::EventCalendar::Event.all }
    it { should be_a_kind_of Array }
  end

  describe '.fetch_events' do
    subject { ::EventCalendar::Event.fetch_events(calendar) }
    let(:start_on) { Date.parse('2013-01-01') }
    let(:end_on) { Date.parse('2013-01-31') }
    let(:calendar) { ::EventCalendar::Calendar.new() }
    before do
      calendar.stub(:start_on => start_on)
      calendar.stub(:end_on => end_on)
      ::EventCalendar::Event.stub(:all).and_return {
        [ ::EventCalendar::Event.new(Date.parse('2013-01-08')),
          ::EventCalendar::Event.new(Date.parse('2013-01-18')),
          ::EventCalendar::Event.new(Date.parse('2013-02-02')),
          ::EventCalendar::Event.new(Date.parse('2013-02-03')),
          ::EventCalendar::Event.new(Date.parse('2013-02-08'))
        ]
      }
    end
    it { should have(2).items }
  end
end