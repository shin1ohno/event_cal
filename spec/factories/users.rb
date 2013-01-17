FactoryGirl.define do
  factory :user do
    user_name { Faker::Name.first_name }
  end
end
