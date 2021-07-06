class Fixcolumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :musics_playlists, :Music_id, :music_id
    rename_column :musics_playlists, :Playlist_id, :playlist_id
  end
end
