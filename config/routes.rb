Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  root 'posts#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end