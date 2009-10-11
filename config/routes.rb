ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'people'
  map.resources :people

end
