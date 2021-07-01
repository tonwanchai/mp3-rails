require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  let!(:playlist1)       { FactoryBot.create(:playlist)}
  describe "GET /index" do
    it "should renders the index template" do
      get :index   
      expect(response).to render_template("index")
    end

    it "" do
      get :index
      expect()
    end

  end

  describe "GET /show" do
    it "should show playlist" do
      get :show, params: { id: 1}
      
      expect(response).to render_template("show")
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
      @playlist_params = { name:"Platlist name" }
    end

    it "data should be added" do     
      expect{
        post :create , params: { playlist: @playlist_params }
      }.to change(Playlist, :count).by(1) 
      expect(response.status).to eq(302)
    end

    it "data added should be correct" do
      post :create, params: { playlist: @playlist_params }   
      expect(@playlist_params[:name]).to eq(Playlist.last[:name])
      expect(response.status).to eq(302)
    end 

    it "should redirect to show/id path" do
      post :create, params: { playlist: @playlist_params }
      expect(response).to redirect_to(:action => :show , :id => assigns(:playlist).id)
      expect(response.status).to eq(302)
    end

    it "data sould not be added" do
      expect {
        post :create, params: { playlist: { name:"" } }
      }.to_not change(Playlist,:count) 
      expect(response.status).to eq(422)   
    end

  end

  describe "GET /edit" do
  end

  describe "PATCH /update" do
    before do
      @playlist_params = { name:"Platlist name" }
    end

    it "data added should be correct" do
      patch :update , params: { id: 1, playlist: @playlist_params }   
      expect(@playlist_params[:name]).to eq(Playlist.last[:name])
      expect(response.status).to eq(302)
    end 

    it "should redirect to show/id path" do
      patch :update , params: { id: 1, playlist: @playlist_params }
      expect(response).to redirect_to(:action => :show , :id => assigns(:playlist).id)
      expect(response.status).to eq(302)
    end

    it "data sould not be added" do
      expect {
        patch :update , params: { id: 1, playlist: { name:"" } }
      }.to_not change(Playlist,:count) 
      expect(response.status).to eq(422)   
    end
  end

  describe "DELETE /destroy" do
    it "data should be deleted" do
      expect{ delete :destroy, params:{id:1} }.to change(Playlist, :count).by(-1)
      expect(Playlist.where(id:1).first).to eq(nil)
      expect(response.status).to eq(302)
    end
  end

end

