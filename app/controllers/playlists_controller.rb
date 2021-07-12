class PlaylistsController < ApplicationController
  before_action :set_playlist, except: %i[index new create] 

  def index
    @playlists = Playlist.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: { status: 'success', playlists: @playlists } }
      #render :index, status: :ok, json: { status: 'success', playlists: @playlists }
    end
  end

  def show
    #Rails.logger.debug("**************************************#{rails_blob_url(@playlist.picture)}")
    #@playlist_musics = PlaylistMusic.where(playlist_id:params[:id])
    # @playlist = Playlist.find(params[:id])
    @musics = Music.all
    Rails.logger.debug("**************************************#{@playlist_musics}")
  end

  def new
    @playlist = Playlist.new
    @musics = Music.all
  end

  def create
    @playlist = Playlist.new(playlist_params)
    Rails.logger.debug("**************************************#{@playlist}")
    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: "Playlist was successfully created." }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: "PLaylist was successfully updated." }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@playlist = Playlist.where(id: params[:id]).first
    @playlist.musics.clear
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: "Playlist was successfully destroyed." }
      format.json { head :no_content }
    end
    
  end

  def delete_music_from_playlist
    music = Music.where(id: params[:music_id]).first
    @playlist.musics.delete(music)
  end

  def get_all_music
    @musics = Music.all
  end


  def add_music_to_playlist
   
    Rails.logger.debug("::::::::::::::::::::#{params[:music]["music_ids"]}")
    musics = Music.where(id: params[:music]["music_ids"])

    # musics = Music.where(:id.in => params[:music]["music_ids"])
    @playlist.musics << musics
    
    redirect_to "/playlists/#{params[:id]}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:name, :picture)
    end
end
