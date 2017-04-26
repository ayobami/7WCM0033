Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root 'home#index'
  
  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
 end
  
  
  match '/home/registration', to: 'home#registration', via: :all
  match '/home/login', to: 'home#login', via: :all
  match '/home/index', to: 'home#index', via: :all
  match '/home/search', to: 'home#search', via: :all
  match '/home/showroom', to: 'home#show_room', via: :all
  match '/home/logout', to: 'home#logout', via: :all
  match '/home/property', to: 'home#property', via: :all
  match '/home/buy', to: 'home#all_properties', via: :all  
  match '/home/latestproperties', to: 'home#latest_properties', via: :all
  match '/home/featuredproperties', to: 'home#featured_properties', via: :all
  match '/home/contact', to: 'home#contact', via: :all
  match '/home/chat', to: 'home#chat', via: :all
  match '/home/feed', to: 'home#feed', via: :all
  match '/home/interests', to: 'home#interests', via: :all
  match '/home/searches', to: 'home#searches', via: :all
  match '/home/events', to: 'home#events', via: :all
  match '/home/deleteinterest', to: 'home#delete_interest', via: :all
  match '/home/deletesearch', to: 'home#delete_search', via: :all
  match '/home/chatrequest', to: 'home#chat_request', via: :all
  
  match '/home/propertymortgage', to: 'home#property_mortgage', via: :all

  match '/account/changepassword', to: 'account#change_password', via: :all
  match '/account/forgotpassword', to: 'account#forgot_password', via: :all
  match '/account/updateprofile', to: 'account#update_profile', via: :all
  match '/account/resetpassword', to: 'account#reset_password', via: :all


  match '/portal/property', to: 'portal#property', via: :all
  match '/portal/editproperty', to: 'portal#edit_property', via: :all
  match '/portal/propertyevaluation', to: 'portal#property_evaluation', via: :all
  match '/portal/evaluationreport', to: 'portal#evaluation_report', via: :all
  match '/portal/properties', to: 'portal#properties', via: :all
  match '/portal/showroom', to: 'portal#show_room', via: :all  
  match '/portal/mortgages', to: 'portal#mortgages', via: :all  
  match '/portal/mortgageevaluation', to: 'portal#mortgage_evaluation', via: :all
  match '/portal/mortgageremoval', to: 'portal#mortgage_removal', via: :all
  
  match '/admin/audittrail', to: 'admin#audit_trail', via: :all
  match '/admin/contact', to: 'admin#contact', via: :all
  match '/admin/chat', to: 'admin#chat', via: :all
  match '/admin/changepassword', to: 'admin#change_password', via: :all
  match '/admin/index', to: 'admin#index', via: :all
  match '/admin/registration', to: 'admin#registration', via: :all
  match '/admin/news', to: 'admin#news', via: :all
  match '/admin/users', to: 'admin#users', via: :all
  match '/admin/staff', to: 'admin#staff', via: :all
  match '/admin/createnews', to: 'admin#create_news', via: :all
  match '/admin/editnews', to: 'admin#edit_news', via: :all
  match '/admin/deletenews', to: 'admin#delete_news', via: :all
  match '/admin/adverts', to: 'admin#adverts', via: :all
  match '/admin/createadvert', to: 'admin#create_advert', via: :all
  match '/admin/editadvert', to: 'admin#edit_advert', via: :all
  match '/admin/deleteadvert', to: 'admin#delete_advert', via: :all
  match '/admin/activateuser', to: 'admin#activate_user', via: :all
  match '/admin/deactivateuser', to: 'admin#deactivate_user', via: :all
  match '/admin/activatestaff', to: 'admin#activate_staff', via: :all
  match '/admin/deactivatestaff', to: 'admin#deactivate_staff', via: :all
  match '/admin/updateprofile', to: 'admin#update_profile', via: :all
  match '/admin/events', to: 'admin#events', via: :all
  match '/admin/createevent', to: 'admin#create_event', via: :all
  match '/admin/showroom', to: 'admin#show_room', via: :all
  
  match '/report/analytics', to: 'report#analytics', via: :all
  match '/report/users', to: 'report#users', via: :all
  match '/report/properties', to: 'report#properties', via: :all
  match '/report/mortgages', to: 'report#mortgages', via: :all
  match '/report/purchases', to: 'report#purchases', via: :all

  
end
