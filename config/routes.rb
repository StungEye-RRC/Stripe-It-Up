Rails.application.routes.draw do
  get 'checkout/new', to: 'checkout#new'
  post 'checkout/create', to: 'checkout#create'
  get 'cancel', to: 'checkout#cancel'
  get 'success', to: 'checkout#success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
