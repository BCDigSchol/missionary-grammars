Rails.application.routes.draw do

  get 'acknowledgements' => 'pages#show', :page => 'acknowledgements'
  get 'bibliography' => 'pages#show', :page => 'bibliography'
  get 'contact' => 'pages#show', :page => 'contact'
  get 'cv' => 'pages#show', :page => 'cv'
  get 'dictionary' => 'pages#show', :page => 'dictionarys'
  get 'map' => 'pages#show', :page => 'map'
  get 'overview' => 'pages#show', :page => 'overview'
  get 'prosopography' => 'pages#show', :page => 'prosopography'
  get 'praxis' => 'pages#show', :page => 'praxis'
  get 'preface' => 'pages#show', :page => 'preface'
  get 'contact' => 'pages#show', :page => 'contact'
  get 'project-team' => 'pages#show', :page => 'project-team'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destory'

  get 'authors' => 'authors#index'
  get 'authors/edit' => 'authors#editlist'
  get 'authors/:id/edit' => 'authors#edit'

  get 'texts/search' => 'texts#search'
  post 'texts/search' => 'texts#search'

  get 'texts/:id/structure' => 'texts#structure'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'edit' => 'edit#index'

  resources :languages
  resources :texts do
    get 'read', on: :member
  end
  resources :authors
  resources :orthographies
  resources :text_categories, :path => '/categories'
  resources :missionary_groups, :path => '/groups'
  resources :publishers

  root :to => 'pages#home'


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
