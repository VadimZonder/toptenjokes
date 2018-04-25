Rails.application.routes.draw do
    resources :students do 
    resources :results
    end
  resources :results
  resources :students
resources :users
resources :pfilters
resources :lfilters
 resources :parents

post '/search' => 'students#search'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#create', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'page/index'
    # You can have the root of your site routed with "root"
  #ROOT PAGE IS THE STATI_COTROLLER'S INDEX METHOD WHICH WILL BE RENDERED IN VIEWS
   root 'static_pages#home'
     get '/about' => 'static_pages#about'
 
  #
  #devise_for :users, path: 'users'
# eg. http://localhost:3000/users/sign_in
#devise_for :admins, path: 'admins'
# eg. http://localhost:3000/admins/sign_in

#devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
#devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }

#ROUTING BROWSER PATH REQUESTS TO THE CONTROLLERS AND THEIR METHODS FOR THE CONTROLLERS TO ACTIVATE VIEWS
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


   
  
		match ':controller(/:action(/:id))', :via => :get


get '/teacher' => 'users#teacher'
  get '/parent' => 'users#parent'
		get '/principal' => 'users#principal'
		  get '/teacher' => 'users#teacher'
		get '/student' => 'users#student'



end
