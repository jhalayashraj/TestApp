class StripeChargesServices
  DEFAULT_CURRENCY = 'usd'.freeze

  def initialize(params, user)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @user = user
  end

  def call
    create_charge(create_customer)
  end

  private

  attr_accessor :user, :stripe_email, :stripe_token

  def create_customer
    customer = Stripe::Customer.create(
      email: stripe_email,
      source: stripe_token
    )
    customer
  end

  def create_charge(customer)
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 500,
      description: customer.email,
      currency: DEFAULT_CURRENCY
    )
  end
end
