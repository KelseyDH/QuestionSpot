Weblog::Application.routes.draw do

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, 
            controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

#delayed_job
match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]


 get "/jspractices" => "jspractice#index"
 get "/exercise1" => "jspractice#exercise1"

  get "/about_us" => "home#about"

  get "/welcome" => "home#welcome"

  get "/faq" => "home#faq"

  get "/help" => "help#index"

  # get "/questions" => "questions#index"
  # post "/questions" => "questions#create"
  # get "/questions/:id" => "questions#show"
  # get "/questions/:id/edit" => "questions#edit"
  # get "/questions/new" => "questions#new"
  # match "/questions/:id/update" => "questions#update", via: [:put, :patch]
  # delete "/questions/:id"  => "questions#destroy"

######  ^^^^^^^^^^^^^^^^^^^^
###RESOURCES BELOW DOES ALL OF THE ABOVE!!!

    resources :answers, only: [] do
      resources :comments, only: [:create, :destroy]
    end

  resources :questions  do#, except: #OR# only: [:index, :new, :create]
    resources :favourites, only: [:create, :destroy]
    resources :votes, only: [:create, :update, :destroy]
    
    resources :answers
    #IMPORTANT: resources :answers is NESTED INSIDE resources:questions, 
    #nesting changes :answers path route
    #TO NEW ROUTE OF: "/questions/:questionid/answers" => "answers#create"
    #RATHER THAN: "/answers" => "answers#create"
     
     member do
        post :vote_up
        post :vote_down
      end
      
      ## Can use "on: :member" for each instead, like as below with collection
      post :search, on: :collection

    end

  root "questions#index"


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
