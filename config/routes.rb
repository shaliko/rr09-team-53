ActionController::Routing::Routes.draw do |map|
  map.login "login",    :controller => "user_sessions", :action => "new"
  map.logout "logout",  :controller => "user_sessions", :action => "destroy"

  map.resources :user_sessions

  map.resources :users, :has_many => :templates

  #static pages
  map.about 'about', :controller => 'static_pages', :action => 'about'

  map.root :controller => 'static_pages', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
