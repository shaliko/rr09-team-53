ActionController::Routing::Routes.draw do |map|
  map.login "login",    :controller => "user_sessions", :action => "new"
  map.logout "logout",  :controller => "user_sessions", :action => "destroy"
  map.sign_up 'signup', :controller => "users", :action => "new"
  map.reset_password  "reset_password", :controller => "password_resets", :action => "new"

  map.resources :user_sessions

  map.resources :users

  map.resources :password_resets

  #static pages
  map.about '/about', :controller => 'static_pages', :action => 'about'

  map.root :controller => 'static_pages', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
