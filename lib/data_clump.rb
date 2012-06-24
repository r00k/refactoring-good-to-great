# require 'active_support/core_ext/date/calculations'
# require 'active_support/core_ext/numeric/time'
require 'active_support/all'
require 'ostruct'

class OrdersReport

  def initialize(orders, start_date, end_date)
    @orders = orders
    @start_date = start_date
    @end_date = end_date
  end

  def total_sales
    orders_in_range = @orders.select { |order| order.placed_at >= @start_date && order.placed_at <= @end_date }
    orders_in_range.map(&:amount).sum
  end
end

class Order < OpenStruct
end
