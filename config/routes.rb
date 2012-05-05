Railslinks::Application.routes.draw do
  devise_for :users


  resources :links do
    collection do 
      get "get_title"
    end
  end

  namespace :admin do
    resources :users, :categories
    resources :links do
      member do 
        get 'validate'
        get 'unvalidate'
      end
    end
  end

  root :to => 'admin/links#index'

end
