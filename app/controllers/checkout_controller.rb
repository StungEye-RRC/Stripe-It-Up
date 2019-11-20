# frozen_string_literal: true

class CheckoutController < ApplicationController
  def new; end

  def create
    product = Product.find(params[:id])

    if product.nil?
      redirect_to root_path
      return
    end

    base_url = "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: product.name,
          description: product.description,
          amount: product.price_cents,
          currency: 'cad',
          quantity: 1
        }
      ],
      success_url: base_url + '/success?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: base_url + '/cancel'
    )

    respond_to do |format|
      format.js # renders create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end
end
