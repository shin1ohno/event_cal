require 'spec_helper'
require 'active_support/core_ext'
require_relative '../../../lib/event_calendar/calendar'

describe ::EventCalendar::Calendar do
  let(:calendar) { ::EventCalendar::Calendar.new(Date.parse('2013-01-01')) }

  describe '#start_on' do
    subject { calendar.start_on }
    it { should == Date.parse('2012-12-30') }
  end

  describe '#end_on' do
    subject { calendar.end_on }
    it { should == Date.parse('2013-02-02') }
  end

  describe '#fetch_events' do
    subject { calendar.fetch_events }

    context '1 subclass for ::EventCalendar::Event' do
      context '3 events for calendar range and 2 is out of the range' do
        before do
          class Birthday < ::EventCalendar::Event
            def self.all
              [ self.new(Date.parse('2013-01-08')),
                self.new(Date.parse('2013-01-18')),
                self.new(Date.parse('2013-02-02')),
                self.new(Date.parse('2013-02-03')),
                self.new(Date.parse('2013-02-08'))
              ]
            end
          end
        end
        it { should have(3).events }

        context 'another subclass for ::EventCalendar::Event' do
          context 'has 2 events in the range' do
            before do
              class Holyday < ::EventCalendar::Event
                def self.all
                  [ self.new(Date.parse('2013-01-01')),
                    self.new(Date.parse('2013-01-14'))
                  ]
                end
              end
            end
            it { should have(3+2).events }
          end
        end
      end
    end
  end
end
