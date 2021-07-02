require 'rails_helper'

RSpec.describe PlaylistsMusicsController, type: :controller do
  let!(:playlist1)            { FactoryBot.create(:playlist) }
  let!(:music1)               { FactoryBot.create(:music) }
  let(:playlist_music1)       { FactoryBot.build(:playlist_music) }
  before(:each) do
    playlist1.playlist_musics <<  playlist_music1
    music1.playlist_musics << playlist_music1
  end

  describe "GET /index" do
    it "should renders the index template" do
      get :index   
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /new" do
    it "should return status 200" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "POST /create" do
    before do
      @playlist_music_params =  { playlist_id: "1", "music" => { music_ids:["1"] } }
    end

    it "data should be added" do     
      expect{
        post :create , params: { playlist_id: "1", "music" => { music_ids:["1"] } }
      }.to change(PlaylistMusic, :count).by(1) 
      expect(response.status).to eq(302)
    end

    it "data added should be correct" do
      post :create, params: @playlist_music_params
      expect(@playlist_music_params[:playlist_id].to_i).to eq(PlaylistMusic.last["playlist_id"])
      expect(response.status).to eq(302)
    end 

    it "data sould not be added" do
      expect {
        post :create, params: { playlist_id: "999", "music" => { music_ids:["1"] } }
      }.to_not change(PlaylistMusic, :count) 
      expect(response.status).to eq(302)   
    end

  end

  describe "DELETE /destroy" do
    it "data should be deleted" do
      expect{ delete :destroy, params:{id:1} }.to change(PlaylistMusic, :count).by(-1)
      expect(PlaylistMusic.where(id:1).first).to eq(nil)
      expect(response.status).to eq(302)
    end
  end
end
