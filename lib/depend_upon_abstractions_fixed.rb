class User
  def charge_for_subscription
    PaymentGateway.charge_for_subscription(self)
  end

  def create_as_customer
    PaymentGateway.create_customer(self)
  end
end

class Refund
  def process!
    PaymentGateway.refund(self)
  end
end

# lib/payment_gateway.rb
class PaymentGateway
  SUBSCRIPTION_AMOUNT = 10.to_money

  def self.charge_for_subscription(user)
    braintree_id = BraintreeGem.find_user(user.email).braintree_id
    BraintreeGem.charge(braintree_id, SUBSCRIPTION_AMOUNT)
  end

  def self.create_customer(user)
    BraintreeGem.create_customer(user.email)
  end

  def self.refund(refund_model)
    transaction_id = BraintreeGem.find_transaction(order.braintree_id)
    BraintreeGem.refund(transaction_id, order.amount)
  end
end
