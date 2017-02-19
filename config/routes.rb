Rails.application.routes.draw do
  root 'home#index'
  
  get 'home/index'

  get 'home/registration'
  get 'home/register_user'
  

  get 'test/home'

  get 'test/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
