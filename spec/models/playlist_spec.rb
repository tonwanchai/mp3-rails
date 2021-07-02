require 'rails_helper'

RSpec.describe Playlist, type: :model do
  it { should have_many(:playlist_musics) }
  it { should validate_presence_of(:name) }
  it { should have_many(:musics).through(:playlist_musics) }
end
