require_relative '../lib/data_clump'

describe OrdersReport do
  describe '#total_sales_within_range' do
    it 'returns total sales in range' do
      order_within_range = Order.new(amount: 5, placed_at: Date.new(2012, 1, 28))
      order_out_of_range = Order.new(amount: 5, placed_at: Date.new(2012, 1, 1))
      orders = [order_within_range, order_out_of_range]

      OrdersReport.
        new(orders, Date.new(2012, 1, 15), Date.new(2012, 1, 30)).
        total_sales_within_range.should == 5
    end
  end
end
