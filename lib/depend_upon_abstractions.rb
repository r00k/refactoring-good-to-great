class User
  SUBSCRIPTION_AMOUNT = 10.to_money

  def charge_for_subscription
    BraintreeGem.charge(SUBSCRIPTION_AMOUNT)
  end

  def create_as_customer
    BraintreeGem.create_customer(user.name)
  end
end

class Refund
  def process!
    BraintreeGem.refund(order.amount, user.braintree_id)
  end
end
