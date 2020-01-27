Rails.application.routes.draw do

  root to: 'home#top'
  get 'home/about' => 'home#about'

  devise_for :users

  resources :books

  resources :users,only: [:show,:index,:edit,:update]

end