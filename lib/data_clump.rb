require 'date'
require 'ostruct'

class OrdersReport
  def initialize(orders, date_range)
    @orders = orders
    @date_range = date_range
  end

  def total_sales_within_date_range
    total_sales(orders_within_range)
  end

  private

  def total_sales(orders)
    orders.map(&:amount).inject(0, :+)
  end

  def orders_within_range
    @orders.select { |order| order.placed_between?(@date_range) }
  end
end

class DateRange < Struct.new(:start_date, :end_date)
  def include?(date)
    (start_date..end_date).cover? date
  end
end

class Order < OpenStruct
  def placed_between?(date_range)
    date_range.include?(placed_at)
  end
end
