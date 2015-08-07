Rails.application.routes.draw do
  root 'welcome#second_landing'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  resources :sessions

  resources :users do
    resources :high_levels
  end

  resources :high_levels do
    resources :one_month_goals
  end

  resources :one_month_goals do
    resources :activities
  end

  resources :activities

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'activities/:id/complete' => 'activities#complete', as: 'activities_complete'
  get 'users' => 'users#index'
  get 'welcome' => 'welcome#index'
  delete 'logout' => 'sessions#destroy'
  get 'send_mail' => 'activities#current_activity'

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
