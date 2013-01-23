require 'spec_helper'
require_relative '../../../lib/event_calendar/calendar'

describe ::EventCalendar::CalendarOwner do
  describe 'setting owner of calendar' do
    subject { calendar.owner }
    let(:user) { FactoryGirl.build(:user) }
    let(:calendar) { user.new_calendar }
    before do
      class User < ActiveRecord::Base
        include ::EventCalendar::CalendarOwner
      end
    end
    it { should == user }
  end
end
