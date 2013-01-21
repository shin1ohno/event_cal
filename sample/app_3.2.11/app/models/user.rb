class User < ActiveRecord::Base
  has_many :orders
  attr_accessible :user_name, :birth_day
end
