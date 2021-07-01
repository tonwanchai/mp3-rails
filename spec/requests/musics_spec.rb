require 'rails_helper'

RSpec.describe MusicsController, type: :controller do
  let!(:music1)       { FactoryBot.create(:music)}
  describe "GET /index" do
    it "should renders the index template" do
      get :index   
      expect(response).to render_template("index")
    end

    it "should return playlists correctly" do
      get :index
      res = JSON.parse(response.body)
      pp res
      #expect(res["playlists"].count).to eq(Playlist.all.count)
    end

  end

end
