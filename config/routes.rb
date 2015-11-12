Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay 5out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'pages/index'

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

  resources :friendships

  get 'friendship/my_friends' => 'friendships#my_friends', as: :my_friends

  get 'friendship/my_friends/:id' => 'friendships#grant_request', as: :grant_request

  scope module: 'mission' do
    resources :missions do
      post 'supervise' => 'supervisions#create', as: :create_supervision
      get 'supervision/:id' => 'supervisions#grant_supervision', as: :grant_supervision
    end

    get 'mission/mission_board' => 'missions#mission_board', as: :mission_board
    get 'mission/my_missions' => 'missions#my_missions', as: :my_missions
  end
end
