Remoteassessment::Application.routes.draw do
  root :to => 'static#index'
  get '/about' => 'static#about', as: 'about'

  get '/assignments' => 'assignments#index', as: 'teacher_root'

  post '/receivesms' => 'messages#receive_text_message'

  resources :assignments, only: [:new, :create, :show, :edit, :update]
  
  resources :answers

  resources :choices

  resources :questions

  resources :students

  resources :groups

  resources :messages, only: [:new, :create]
  
  # post '/messages' => 'messages#send_text_message'
  
  devise_for :teachers

  devise_scope :teacher do
    get '/login' => 'devise/sessions#new'
  end

  get '/test_send_action' => 'messages#test_send_action'
  get '/test_receive_answer' => 'messages#test_receive_answer'
  post '/test_receive_answer' => 'messages#test_receive_answer'

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
