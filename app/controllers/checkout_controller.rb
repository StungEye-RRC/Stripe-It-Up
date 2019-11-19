# frozen_string_literal: true

class CheckoutController < ApplicationController
  def new; end

  def create
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: 'T-shirt',
          description: 'Comfortable cotton t-shirt',
          amount: 500,
          currency: 'cad',
          quantity: 2
        },
        {
          name: 'Coffee Mug',
          description: 'Great for coffee times!',
          amount: 950,
          currency: 'cad',
          quantity: 1
        }
      ],
      success_url: 'http://localhost:3000/success?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: 'http://localhost/cancel'
    )

    respond_to do |format|
      format.js # just renders messages/create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end
end
