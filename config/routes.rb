Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :posts do 
    resources :comments 
  end
  resources :categories, only: [:index, :new, :create]
# root 'posts#index'  # 定義首頁

get 'users' => 'users#index'
get 'posts' => 'posts#index'

get 'posts' => 'posts#show'
get 'posts' => 'posts#new' # 要不要加這行???

# added user register page/ 7  config/routes.rb
get '/register', to: 'users#new'
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'
  # You can have the root of your site routed with "root"
# added navbar to the app, created navigation partial/  config/routes.rb
  root 'posts#index'

resources :posts, except: [:destroy] do
  member do   # 客製化連結
    post :vote  # 這樣會產出 posts/1/vote
  end

  resources :comments, only: [:create, :show] do
    member do
      post :vote # 產出 posts/1/comments/1/vote
    end
  end
end
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
