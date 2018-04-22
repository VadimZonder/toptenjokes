Rails.application.routes.draw do
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


   
   #another page sample
   #get 'static_pages/sample'
   #match ':controller(/:action(/:id))', :via => :get
   #rauting uri /sample to controller static_pages method sample
   get '/sample' => 'static_pages#sample'
   		#get 'welcome/index'
		match ':controller(/:action(/:id))', :via => :get


get '/teacher' => 'users#teacher'
  get '/parent' => 'users#parent'
		get '/principal' => 'users#principal'
		  get '/teacher' => 'users#teacher'
		get '/student' => 'users#student'


#TRYING TO HAVE ONE VIEW OF USERS
#get "/student", to: "users#users", as: "student"		
# get "/teacher", to: "users#users", as: "teacher"
#get '/parent' => 'users#users'
#get '/principal' => 'users#users'
	
	 

# get "/parent?"


  #devise_for :users
  #devise_for :users
  #root 'welcome#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
