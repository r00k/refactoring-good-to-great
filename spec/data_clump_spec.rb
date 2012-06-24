require_relative '../lib/data_clump'

describe OrdersReport do
  describe '#total_sales' do
    it 'returns total sales in range' do
      order_this_week = Order.new(amount: 5, placed_at: Date.today)
      order_last_week = Order.new(amount: 5, placed_at: Date.today - 10.days)
      orders = [order_this_week, order_last_week]

      OrdersReport.new(orders, Date.today.beginning_of_week, Date.today.end_of_week).total_sales.should == 5
    end
  end
end
