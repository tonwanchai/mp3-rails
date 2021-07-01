class CreatePlaylistMusics < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_musics do |t|
      t.references :music, null: false, foreign_key: true
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
