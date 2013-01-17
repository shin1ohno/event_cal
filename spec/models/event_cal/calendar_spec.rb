require_relative '../../spec_helper'
require_relative '../../../app/models/event_cal/calendar'

require 'active_support/core_ext'

describe EventCal::Calendar do
  let(:calendar) { EventCal::Calendar.new('2013-01-01') }
  describe '#start_on' do
    subject { calendar.start_on }
    it { should == Date.parse('2012-12-30') }
  end
  describe '#end_on' do
    subject { calendar.end_on }
    it { should == Date.parse('2013-02-02') }
  end
end