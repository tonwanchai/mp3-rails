Rails.application.routes.draw do
  
  resources :musics
  resources :playlists do
    member do
      get :get_all_music
      patch :add_music_to_playlist
      patch :delete_music_from_playlist
    end
  end

  
  resources :playlists_musics
  post "playlists_musics/new"  => "playlists_musics#create"
  #namespace :api, defaults: { format: 'json' } do
  #  resources :musics, only: [:show]
  #end
  root to: 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
