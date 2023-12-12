Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  get 'students/one' => 'students#one'
  get 'students/two' => 'students#two'
  get 'students/three' => 'students#three'
  get 'students/four' => 'students#four'




  resources :students do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root 'students#index'


end