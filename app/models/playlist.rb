class Playlist < ApplicationRecord
  has_one_attached :picture
  has_many :playlist_musics, dependent: :destroy
  has_many :musics, through: :playlist_musics
  accepts_nested_attributes_for :playlist_musics
  validates :name , presence: true
  
end
