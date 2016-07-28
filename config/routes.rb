Rails.application.routes.draw do
  resources :items
  resources :orders
  resources :messages
  resources :users
  resources :todos
  resources :rental_units
  get 'profiles/donors', :to => 'profiles#donor_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
