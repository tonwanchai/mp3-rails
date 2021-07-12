class Playlist < ApplicationRecord
  validates :name , presence: true
  has_one_attached :picture
  has_and_belongs_to_many :musics

  validates :picture, presence: true, blob: {content_type: :image}
  validates :picture, presence: true, blob: {content_type: ['image/png', 'image/jpg', 'image/jpeg'] }
  #has_many :playlist_musics, dependent: :destroy
  #has_many :musics, through: :playlist_musics
  #accepts_nested_attributes_for :playlist_musics
end
