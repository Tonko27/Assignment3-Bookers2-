Rails.application.routes.draw do
  root to: 'homes#top'

  get "about" => "top#about" , as: "about"

  devise_for :users, controllers: {
  registrations: 'users/registrations',
  confirmations: 'users/confirmations',
}

  resources :books
  resources :users, only: [:new, :create, :index, :show, :edit, :update]


end
