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
  match '/contractor_profiles/:id', to: 'contractor_profile#show'
  match '/companies_signin', to: 'sessions#new'
  match '/companies_signout', to: 'sessions#destroy', via: :delete
  match '/contractors_signin', to: 'contractor_sessions#new'
  match '/contractors_signout', to: 'contractor_sessions#destroy', via: :delete
  match 'companies_search', to: 'companies#search'
  match 'contractors_search', to: 'contractors#search'
  match 'showAllCompany', to: 'companies#showall'

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


end
