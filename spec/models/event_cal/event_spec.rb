require_relative '../../spec_helper'
require_relative '../../../app/models/event_cal/event'

require 'active_support/core_ext'

describe EventCal::Event do
  let(:event) { EventCal::Event.new('2013-01-01') }
  describe '#held_on' do
    subject { event.held_on }
    it { should == Date.parse('2013-01-01') }
  end
end