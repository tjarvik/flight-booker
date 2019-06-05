Rails.application.routes.draw do
  get 'bookings/new'
  post 'bookings/new', to: 'bookings#create'
  get 'bookings/:id(.:format)', to: 'bookings#show'
  root 'flights#index'
  get 'flights/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
