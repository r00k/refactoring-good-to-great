# app/models/user.rb
class User
  SUBSCRIPTION_AMOUNT = 10.to_money

  def initialize(payment_gateway)
    @payment_gateway = payment_gateway
  end

  def charge_for_subscription
    @payment_gateway.charge_for_subscription
  end

  def create_as_customer
    @payment_gateway.create_customer(user.name)
  end
end

class Refund
  def initialize(payment_gateway)
    @payment_gateway = payment_gateway
  end

  def process!
    @payment_gateway.refund(self)
  end
end

# New file: lib/payment_gateway.rb
class PaymentGateway
  def charge_for_subscription(amount)
    Braintree.charge(amount)
  end

  def create_customer(customer_name)
    Braintree.create_customer(customer_name)
  end

  def refund(refund)
    Braintree.refund(refund.order_amount, refund.user_braintree_id)
  end
end
