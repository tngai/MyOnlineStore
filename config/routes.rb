Rails.application.routes.draw do
  post 'sessions' => 'sessions#create'
  get 'sessions' => 'sessions#new', as: :new_sessions
  delete  'sessions' => 'sessions#destroy'

  get    'users' => 'users#index', as: :users
  post   'users'=> 'users#create'
  get    'users/new' => 'users#new', as: :new_user  
  get    'users/:id/edit' => 'users#edit', as: :edit_user
  get    'users/:id' => 'users#show', as: :user
  patch  'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  
  get    'listings' => 'listings#index', as: :listings
  post   'listings'=> 'listings#create'
  get    'listings/new' => 'listings#new', as: :new_listing  
  get    'listings/:id/edit' => 'listings#edit', as: :edit_listing
  get    'listings/:id' => 'listings#show', as: :listing
  patch  'listings/:id' => 'listings#update'
  delete 'listings/:id' => 'listings#destroy'

  get 'pages/about' => 'pages#about', as: :pages_about
  get 'pages/contact' => 'pages#contact', as: :pages_contact
  
  root 'sessions#new' 



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
