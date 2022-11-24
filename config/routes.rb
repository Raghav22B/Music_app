Rails.application.routes.draw do
  devise_for :users
  root "albums#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources:albums 

end
