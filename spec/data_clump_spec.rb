require_relative '../lib/data_clump'

describe OrdersReport do
  describe '#total_sales_within_range' do
    it 'returns total sales in range' do
      order_placed_this_week = Order.new(amount: 5, placed_at: Date.today)
      order_placed_last_week = Order.new(amount: 5, placed_at: Date.today - 10.days)
      orders = [order_placed_this_week, order_placed_last_week]

      OrdersReport.new(orders, Date.today.beginning_of_week, Date.today.end_of_week).total_sales_within_range.should == 5
    end
  end
end
