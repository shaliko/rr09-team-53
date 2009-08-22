ActionController::Routing::Routes.draw do |map|

  #static pages
  map.about '/about', :controller => 'static_pages', :action => 'about'

  map.root :controller => 'static_pages', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
