class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]
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
    Rails.logger.debug("**************************************#{params[:id]}")
    @playlist_musics = PlaylistMusic.where(playlist_id:params[:id])
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
        format.html { redirect_to @playlist, notice: "Music was successfully updated." }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @playlist = Playlist.where(id: params[:id]).first
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to musics_url, notice: "Music was successfully destroyed." }
      format.json { head :no_content }
    end
    
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
