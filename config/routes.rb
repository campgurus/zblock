Rails.application.routes.draw do

  
  resources :contacts, only: [:new, :create]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :authors
  root to: 'blog/posts#index'

  namespace :authors do
    get '/account' => 'accounts#edit', as: :account
    put '/info' => 'accounts#update_info', as: :info
    put '/change_password' => 'accounts#change_password', as: :change_password
    resources :posts do
      put 'publish' => 'posts#publish', on: :member
      put 'unpublish' => 'posts#unpublish', on: :member
    end
  end

  scope module: 'blog' do
    get 'about' => 'pages#about', as: :about
    # get 'contact' => 'pages#contact', as: :contact
    resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
