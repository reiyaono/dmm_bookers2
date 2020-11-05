Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: %i[index show edit update]
  resources :books, only: %i[index show edit update create destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
