class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  # rescue_from Stripe::CardError, with: :catch_exception
  # def new
  # end
  #
  # def create
  #   StripeChargesServices.new(charges_params, current_user).call
  #   redirect_to new_charge_path
  # end
  #
  # private
  #
  # def charges_params
  #   params.permit(:stripeEmail, :stripeToken, :order_id)
  # end
  #
  # def catch_exception(exception)
  #   flash[:error] = exception.message
  # end
end
