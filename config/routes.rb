ActionController::Routing::Routes.draw do |map|
  map.resources :friendships

  map.login "login",    :controller => "user_sessions", :action => "new"
  map.logout "logout",  :controller => "user_sessions", :action => "destroy"
  map.sign_up 'signup', :controller => "users", :action => "new"
  map.reset_password  "reset_password", :controller => "password_resets", :action => "new"

  map.resources :user_sessions

  map.resources :users, :has_many => :templates

  map.resources :password_resets
  map.resources :friendships

  #static pages
  map.about   'about',  :controller => 'static_pages',  :action => 'about'
  map.search  'search', :controller => 'search',        :action => 'index'

  map.root :controller => 'static_pages', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
