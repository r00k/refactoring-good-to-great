class User
  def charge_for_subscription
    PaymentGateway.new.charge_for_subscription(self)
  end

  def create_as_customer
    PaymentGateway.new.create_customer(self)
  end
end

class Refund
  def process!
    PaymentGateway.new.refund(self)
  end
end
