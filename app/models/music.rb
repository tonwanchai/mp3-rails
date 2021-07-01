class Music < ApplicationRecord
  has_one_attached :mp3
  has_many :playlist_musics
  has_many :playlists, through: :playlist_musics
  accepts_nested_attributes_for :playlist_musics
  validates :name , presence: true

end
