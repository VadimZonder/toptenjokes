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


  
    resources :sessions, only: [:new, :create, :destroy]
    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#create', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    get 'page/index'
    
    # You can have the root of your site routed with "root"
    #ROOT PAGE IS THE STATI_COTROLLER'S INDEX METHOD WHICH WILL BE RENDERED IN VIEWS
    root 'static_pages#home'
    get '/about' => 'static_pages#about'
 

	match ':controller(/:action(/:id))', :via => :get


end
