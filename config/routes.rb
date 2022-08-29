Rails.application.routes.draw do
root to: "homes#top"
  get 'home/about' => 'homes#about'
  devise_for :users
  get "books/index" => "books#index"
  resources :books, only: [:index, :create, :edit, :show, :destroy, :update]
  get 'books/index'
  resources :users, only: [:index, :show, :edit, :update, :get_profile_image]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
