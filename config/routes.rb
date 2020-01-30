Rails.application.routes.draw do

  root to: 'home#top'
  get 'home/about' => 'home#about'

  devise_for :users

  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end

  resources :users,only: [:show,:index,:edit,:update]

  get 'relationship/show_follow/:id' => 'relationships#show_follow', as: 'show_follow'
  get 'relationship/show_follower/:id' => 'relationships#show_follower', as: 'show_follower'

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

end