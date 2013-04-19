class Order < ActiveRecord::Base
  belongs_to :user
  attr_accessible :delivery_on, :product_name, :tenant_name
end
