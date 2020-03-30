# frozen_string_literal: true

Rails.application.routes.draw do
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'

  get 'about', to: 'products#about'
  root to: 'products#index'
end
