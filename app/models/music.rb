class Music < ApplicationRecord
  has_one_attached :mp3
  
  validates :name , presence: true

end
