class PlaylistsMusicsController < ApplicationController
  def index
    @playlists_musics = PlaylistMusic.all
  end

  def new
    @playlist_music = PlaylistMusic.new
    @musics = Music.all
  end

  def show
  end

  def create
    @playlist_music = PlaylistMusic.new()
    Rails.logger.debug("-----------------------------#{playlist_music_params}")
    params[:music]["music_ids"].each do |music_id|
      PlaylistMusic.new(playlist_id: params[:playlist_id], music_id: music_id).save
    end
    redirect_to "/playlists/#{params[:playlist_id]}"
  end

  def destroy
    @playlist_music = PlaylistMusic.where(id: params[:id]).first
    p_id = @playlist_music["playlist_id"]
    @playlist_music.destroy
    respond_to do |format|
      format.html { redirect_to playlist_url(p_id), notice: "Music was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def playlist_music_params
      params.permit(:music_ids, :playlist_id)
    end

end
