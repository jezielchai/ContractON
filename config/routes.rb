ContractON::Application.routes.draw do

  root :to => 'static_pages#home'
 
  # RESOURCES
  resources :postings
  resources :contractor_profiles
  resources :companies
  resources :contractors
  resources :profiles
  resources :sessions, only: [:new, :create, :destroy]
  resources :contractor_sessions, only: [:new, :create, :destroy] 
 
  # GETS
  get "contractors/relationship"
  get "static_pages/home"
  get "contractors/signup"
  get "company/signup"
  get "static_pages/home"
  get "static_pages/help"

  # URLS
  match '/index', to: 'companies#index'
  match '/help', to: 'static_pages#help'
  match '/contractors_signup', to: 'contractors#signup'
  match '/companies_show', to: 'sessions#show'
  match '/companies_signup', to: 'companies#signup'
  match '/companies/:id', to: 'companies#show'
  match '/companies_signin', to: 'sessions#new'
  match '/companies_signout', to: 'sessions#destroy', via: :delete
  match '/contractors_signin', to: 'contractor_sessions#new'
  match '/contractors_signout', to: 'contractor_sessions#destroy'
  match 'companies_search', to: 'companies#search'
  match 'contractors_search', to: 'contractors#search'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
 

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end