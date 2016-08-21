Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
  end

  post 'confirm' => 'users#confirm'
  get 'about' => 'welcome#about'

  root 'welcome#index'

  resources :users, only: [:new, :create]

end
