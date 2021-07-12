require 'rails_helper'

RSpec.describe Music, type: :model do
  describe "Validate and associations" do
    it { should validate_presence_of(:name) }
    it { should have_and_belong_to_many(:playlists)}
  end
end