Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'

  get "about" => "homes#about" , as: "about"

  resources :books
  resources :users, only: [:new, :create, :index, :show, :edit, :update]


end
