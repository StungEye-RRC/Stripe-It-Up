# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])

    if product.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: product.name,
          description: product.description,
          amount: product.price_cents,
          currency: 'cad',
          quantity: 1
        },
        {
          name: 'PST',
          description: 'Manitoba Provincial Sales Tax',
          amount: (product.price_cents * 7 / 100.0).round.to_i,
          currency: 'cad',
          quantity: 1
        },
        {
          name: 'GST',
          description: 'Federal Goods and Services Tax',
          amount: (product.price_cents * 5 / 100.0).round.to_i,
          currency: 'cad',
          quantity: 1
        }
      ],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
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
