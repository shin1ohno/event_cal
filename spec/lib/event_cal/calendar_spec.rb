require 'spec_helper'
require 'active_support/core_ext'
require_relative '../../../lib/event_cal/calendar'

describe ::EventCal::Calendar do
  let(:calendar) { ::EventCal::Calendar.new(base_date) }
  let(:base_date) { Date.parse('2013-01-01') }

  before do
    Timecop.freeze('2013-01-01')
    reset_events
  end
  after { Timecop.return }

  def reset_events
    ::EventCal::Event.subclasses.each do |klass|
      klass.class_eval('def self.all; []; end')
    end
  end

  describe 'initializer' do
    subject { ::EventCal::Calendar.new() }
    it { should be_a_kind_of ::EventCal::Calendar }

    describe 'options for initializer' do
      describe 'setting owner' do
        context 'given a option hash' do
          subject { calendar.owner }
          let(:user) { FactoryGirl.build(:user) }
          let(:calendar) { ::EventCal::Calendar.new(owner: user) }
          it { should == user }
          specify { calendar.base_date.should == Date.today }
        end

        context 'given a date and option hash' do
          subject { calendar.owner }
          let(:user) { FactoryGirl.build(:user) }
          let(:calendar) { ::EventCal::Calendar.new(Date.today, owner: user) }
          it { should == user }
          specify { calendar.base_date.should == Date.today }
        end
      end

      context 'geven a invalid option' do
        it 'raises ArgumentError' do
          expect{ ::EventCal::Calendar.new('invalid argument') }.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe '#start_on' do
    subject { calendar.start_on }
    it { should == Date.parse('2012-12-30') }
  end

  describe '#end_on' do
    subject { calendar.end_on }
    it { should == Date.parse('2013-02-02') }
  end

  describe '#base_date' do
    subject { calendar.base_date }
    it { should == base_date }
  end

  describe '#dates' do
    subject { calendar.dates }
    it { should respond_to(:each) }
    it { should have(7*5).dates }
  end

  describe 'to_param' do
    subject { calendar.to_param }
    it { should == "#{base_date.year}/#{base_date.month}/#{base_date.day}" }
  end

  describe '#fetch_events' do
    subject { calendar.events }
    context '1 subclass for ::EventCal::Event' do
      context '3 events for calendar range and 2 is out of the range' do
        before do
          class Birthday < ::EventCal::Event
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

        describe '#events_on(date)' do
          subject { calendar.events_on(Date.parse('2013-01-08')) }
          it { should have(1).events }
        end

        context 'another subclass for ::EventCal::Event' do
          context 'has 2 events in the range' do
            before do
              class HolidayEvent < ::EventCal::Event
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
