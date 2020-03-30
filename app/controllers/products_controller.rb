# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count
  before_action :load_cart

  def index
    @products = Product.all
  end

  def about; end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end
  # No associated view. Redirects back to index.

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end
  # No associated view. Redirects back to index.

  private

  def initialize_session
    session[:visit_count] ||= 0 # Assign this value if nil.
    session[:cart] ||= [] # Empty cart is an empty array.
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
end
