Railslinks::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    match 'login' => 'devise/sessions#new'
    match 'logout' => 'devise/sessions#destroy'
    match 'signup' => 'devise/registrations#new'
  end

  resources :categories, :links

  namespace :admin do
    resources :links, :users
    get "menu" => "categories#index"
  end

  root :to => 'admin/links#index'

end
