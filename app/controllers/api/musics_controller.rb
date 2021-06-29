
module API
  class MusicsController < ApplicationController
    def index
      @musics = Music.all
    end    

    def show
      @music = Music.where(params[:id]).first
      render json: { path: rails_blob_url(@music.mp3)}
    end

  end
end
