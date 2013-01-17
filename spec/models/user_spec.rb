require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }
  it 'saves' do
    user.save.should be_true
  end
end
