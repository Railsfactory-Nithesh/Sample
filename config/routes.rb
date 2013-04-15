Store::Application.routes.draw do
get 'admin' => 'admin#index'
controller :sessions do
get 'login' => :new
post 'login' => :create
delete 'logout' => :destroy
end
resources :users

  root :to => 'admin#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
