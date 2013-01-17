require_relative '../spec_helper'

require 'active_support/core_ext'

class Calendar
  attr :start_on, :end_on

  def initialize(date)
    base_date = Date.parse(date) unless date.class == Date
    @start_on = base_date.beginning_of_month.beginning_of_week(start_day = :sunday)
    @end_on = base_date.end_of_month.end_of_week(start_day = :sunday)
  end
end

describe Calendar do
  let(:calendar) { Calendar.new('2013-01-01') }
  describe '#start_on' do
    subject { calendar.start_on }
    it { should == Date.parse('2012-12-30') }
  end
  describe '#end_on' do
    subject { calendar.end_on }
    it { should == Date.parse('2013-02-02') }
  end
end