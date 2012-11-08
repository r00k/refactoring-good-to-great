class PaymentGateway
  SUBSCRIPTION_AMOUNT = 10.to_money

  def initialize(gateway = BraintreeGem)
    @gateway = gateway
  end

  def charge_for_subscription(user)
    braintree_id = @gateway.find_user(user.email).braintree_id
    @gateway.charge(braintree_id, SUBSCRIPTION_AMOUNT)
  end

  def create_customer(user)
    @gateway.create_customer(user.email)
  end

  def refund(refund_model)
    transaction_id = @gateway.find_transaction(order.braintree_id)
    @gateway.refund(transaction_id, order.amount)
  end
end
