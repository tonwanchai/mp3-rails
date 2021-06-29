Rails.application.routes.draw do
  
  resources :musics

  namespace :api, defaults: { format: 'json' } do
    resources :musics, only: [:show]
  end
  root to: 'musics#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
