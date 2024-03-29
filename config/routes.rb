Studycache::Application.routes.draw do

  get "profile/index"

  devise_for :users

  root :to => "home#index"

  resources :studies  do
    resources :announcements
    resources :dashboard
    resources :access_controls
    resources :questions
    resources :answers
    resources :record, :only => [:show, :edit, :update] do
      get 'print', :on => :member      
    end
    resources :form_builder, :only => [:index, :new, :create, :update] do
        get 'names', :on => :collection
    end
    resources :form, :only => [:index, :create, :show, :update] do
      resources :reminders
      get 'public', :on => :member
      post 'public_create', :on => :member
      get 'invite', :on => :member
      post 'invite', :on => :member
      get 'embed', :on => :member
      get 'thanks', :on => :member
      get 'public_thanks', :on => :member
      post 'embed_create', :on => :member
      get 'print', :on => :member 
      get 'printall', :on => :member
      get 'explorer', :on => :member
    end
    resources :subjects, :only => [:index, :show] do 
      get 'single', :on => :member
      get 'print', :on => :collection
    end
  end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
