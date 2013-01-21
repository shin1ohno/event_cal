# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    delivery_on "2013-01-18"
    product_name "MyString"
    tenant_name "MyString"
    user nil
  end
end
