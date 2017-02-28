Rails.application.routes.draw do
  root 'home#index'
  
  match '/home/registration', to: 'home#registration', via: :all
  match '/home/login', to: 'home#login', via: :all
  match '/home/index', to: 'home#index', via: :all
  match '/home/search', to: 'home#search', via: :all
  match '/home/logout', to: 'home#logout', via: :all

  match '/account/changepassword', to: 'account#change_password', via: :all
  match '/account/forgotpassword', to: 'account#forgot_password', via: :all
  match '/account/forgotpasswordconfirmation', to: 'account#forgot_password_confirmation', via: :all
  match '/account/resetpassword', to: 'account#reset_password', via: :all
  match '/account/resetpasswordconfirmation', to: 'account#reset_password_confirmation', via: :all


  match '/portal/property', to: 'portal#property', via: :all
end
