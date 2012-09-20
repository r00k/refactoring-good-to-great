class User
  SUBSCRIPTION_AMOUNT = 10.to_money

  def charge_for_subscription
    braintree_id = BraintreeGem.find_user(email).braintree_id
    BraintreeGem.charge(braintree_id, SUBSCRIPTION_AMOUNT)
  end

  def create_as_customer
    BraintreeGem.create_customer(email)
  end
end

class Refund
  def process!
    transaction_id = BraintreeGem.find_transaction(order.braintree_id)
    BraintreeGem.refund(transaction_id, amount)
  end
end
