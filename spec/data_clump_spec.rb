require_relative '../lib/data_clump'

describe OrdersReport do
  describe '#total_sales_within_range' do
    it 'returns total sales in range' do
      order_placed_this_week = Order.new(amount: 5, placed_at: Date.new(2012, 1, 28))
      order_placed_last_week = Order.new(amount: 5, placed_at: Date.new(2012, 1, 1))
      orders = [order_placed_this_week, order_placed_last_week]

      OrdersReport.new(orders, Date.new(2012, 1, 15), Date.new(2012, 1, 30)).total_sales_within_range.should == 5
    end
  end
end
