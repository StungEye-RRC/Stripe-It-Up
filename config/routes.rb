# frozen_string_literal: true

Rails.application.routes.draw do
  get 'checkout/new', to: 'checkout#new'
  post 'checkout/create', to: 'checkout#create'
  get 'cancel', to: 'checkout#cancel'
  get 'success', to: 'checkout#success'

  root to: 'products#index'
end
