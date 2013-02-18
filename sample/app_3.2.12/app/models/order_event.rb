require 'event_cal/event'

class OrderEvent < ::EventCal::Event
  attr :order

  def initialize(order)
    @held_on = super(order.delivery_on)
    @name = "#{order.product_name} from #{order.tenant_name}"
    @order = order
  end

  def self.all
    user = User.where(:user_name => 'shin1ohno').first_or_create
    user.save!
    events = []
    20.times do |i|
      order = user.orders.new(
        :delivery_on => Date.parse('2013-02-18') + (((-1) ** i) * i * 2).days,
        :product_name => "Rspec cook book",
        :tenant_name => "amazon.com"
      )
      events << self.new(order)
    end
    events
  end
end
