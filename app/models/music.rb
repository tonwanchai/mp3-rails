class Music < ApplicationRecord
  has_one_attached :mp3
  has_and_belongs_to_many :playlists

  #has_many :playlist_musics, dependent: :destroy
  #has_many :playlists, through: :playlist_musics
  #accepts_nested_attributes_for :playlist_musics
  validates :name , presence: true
end
