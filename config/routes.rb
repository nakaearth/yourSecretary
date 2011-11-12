YourSecretary::Application.routes.draw do

  #resources :haiku_searches
  resources :haiku_searches, :only=>[:index,:show,:new,:update,:edit,:create,:destroy] do
    post :search, :on=>:collection
  end

  resources :haikus

  resources :tweets

  get "my_page/index"

  resources :tasks
  resources :books, :only=>[:show,:edit,:update,:destroy]
  resources :users,:only=>[:edit,:show,:update]
  resources :my_page ,:only=>[:index] do
    get :my_tweets, :on=>:collection
  end

  match "auth/:provider/callback"=> "sessions#create"
  match "auth/logout"=> "sessions#destory"
  #match "secretaries/new_form" =>"secretaries#new_form"
  resources :secretaries,:only=>[:index,:show,:new,:create,:edit,:update,:destroy]
  match "mo/sessions"=> "mo/sessions#index"
  match "smt/sessions"=> "smt/sessions#index"
  match "smt/secretaries"=> "smt/secretaries#index"
  match "smt/secretaries/new"=> "smt/secretaries#new"
  match "smt/my_page"=> "smt/my_page#index"
  match "smt/my_page/my_tweets"=> "smt/my_page#my_tweets"
  
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
  root :to => "secretaries#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
