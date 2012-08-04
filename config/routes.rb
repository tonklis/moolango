Moolango::Application.routes.draw do
	resources :earner_forms

	resources :languages

	resources :hints

	resources :messages

	resources :topics

	resources :rooms

	devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations"}

	resources :users
	
	devise_scope :user do
  	get "logout", :to => "devise/sessions#destroy"
		get "signin", :to => "devise/sessions#new"
		get "signup", :to => "devise/registrations#new"
	end

	match 'interaction' => 'interaction#create', :as => :interaction

	match 'language_selection' => 'display#language', :as => :language_selection

	match 'rooms_listing' => 'display#rooms_listing', :as => :rooms_listing
	
	match 'action' => 'display#action', :as => :action
	
	match 'topics_list' => 'display#topics_list', :as => :topics_list

	match 'conversation_room/:id' => 'display#conversation_room', :as => :conversation_room
	
	match 'admin_room' => 'display#admin_room', :as => :admin_room
		
	match 'join_conversation_room/:id' => 'display#join_conversation_room', :as => :join_conversation_room

	match 'messages/async_outbound' => 'messages#async_outbound', :as => :async_outbound
	
	match 'interaction/end_call' => 'interaction#end_call', :as => :end_call
	
	match 'view_video' => 'display#view_video', :as => :view_video
	
	match 'users/new_balance' => 'users#new_balance', :as => :new_balance

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
  root :to => 'display#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
