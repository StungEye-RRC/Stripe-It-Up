# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index about]
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

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  private

  def initialize_session
    session[:visit_count] ||= 0 # Initialize the visit count on first visit.
    session[:cart] ||= []
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end

  def increment_visit_count
    session[:visit_count] += 1  # Increment the count with each visit.
    @visit_count = session[:visit_count]
  end
end
