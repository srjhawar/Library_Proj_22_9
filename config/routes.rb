Rails.application.routes.draw do

  post '/booking_histories/search',to: 'booking_histories#search',as: 'search_booking_history'
  #resources :booking_histories, param: :room_num, :only => [:show, :new, :create, :index]
  #resources :library_rooms
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
   get '/booking_histories/index',to: 'booking_histories#index',as: 'booking_histories'
   get '/booking_histories/new',to: 'booking_histories#new',as: 'new_booking_history'
   get '/booking_histories/edit',to: 'booking_histories#edit',as:'edit_booking_history'
   get '/booking_histories/show',to: 'booking_histories#show'
   get '/booking_histories/destroy',to: 'booking_histories#destroy'
   post '/booking_histories/create',to: 'booking_histories#create'



  # You can have the root of your site routed with "root"
   root 'booking_histories#index'


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
