require 'rails_helper'

RSpec.describe Music, type: :model do
  describe "field" do
    it { should validate_presence_of(:name) }

    it { should have_many(:playlist_musics)}
  end
end