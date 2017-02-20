Rails.application.routes.draw do
  root 'home#index'
  
  match '/home/registration', to: 'home#registration', via: :all
  match '/home/login', to: 'home#login', via: :all
  match '/home/search', to: 'home#search', via: :all
  

  match '/account/change_password', to: 'account#change_password', via: :all
  match '/account/forgot_password', to: 'account#forgot_password', via: :all
  match '/account/forgot_password_confirmation', to: 'account#forgot_password_confirmation', via: :all
  match '/account/reset_password', to: 'account#reset_password', via: :all
  match '/account/reset_password_confirmation', to: 'account#reset_password_confirmation', via: :all

end
