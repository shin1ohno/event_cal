require 'event_calendar/event'

class OrderEvent < ::EventCalendar::Event
  attr :order

  def initialize(order)
    @held_on = order.delivery_on
    @name = order.product_name + '_' + order.tenant_name
    @order = order
  end

  def self.all
    user = User.where(:user_name => 'shin1ohno').first_or_create
    user.save!
    events = []
    20.times do |i|
      order = user.orders.new(
        :delivery_on => Date.today + (((-1) ** i) * i).days,
        :product_name => "Product_#{i}",
        :tenant_name => "Tenant_#{i}"
      )
      events << self.new(order)
    end
    events
  end
end
