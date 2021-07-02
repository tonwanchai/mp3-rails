require 'rails_helper'

RSpec.describe Music, type: :model do
  describe "Validate and associations" do
    it { should validate_presence_of(:name) }
    it { should have_many(:playlist_musics)}
    it { should have_many(:playlists).through(:playlist_musics) }
  end
end