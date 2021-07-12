class MainController < ApplicationController
  def index
    @musics = Music.all
    @playlists = Playlist.all
    render status: :ok
  end
end