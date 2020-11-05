Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'homes#top'
  resources :users, only: %i[index show edit]
  resources :books, only: %i[index show edit create delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
