require 'rails_helper'

RSpec.describe MusicsController, type: :controller do
  let!(:music1)       { FactoryBot.create(:music)}
  describe "GET /index" do
    it "should renders the index template" do
      get :index   
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /show" do
    it "should show music" do
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
      @music_params = { name:"Platlist name", artist:"tontontontonton" }
    end

    it "data should be added" do     
      expect{
        post :create , params: { music: @music_params }
      }.to change(Music, :count).by(1) 
      expect(response.status).to eq(302)
    end

    it "data added should be correct" do
      post :create, params: { music: @music_params  }   
      expect(@music_params[:name]).to eq(Music.last[:name])
      expect(@music_params[:artist]).to eq(Music.last[:artist])
      expect(response.status).to eq(302)
    end 

    it "should redirect to show/id path" do
      post :create, params: { music: @music_params  }
      expect(response).to redirect_to(:action => :show , :id => assigns(:music).id)
      expect(response.status).to eq(302)
    end

    it "data sould not be added" do
      expect {
        post :create, params: { music: { name:""  ,artist:"1234"} }
      }.to_not change(Music, :count) 
      expect(response.status).to eq(422)   
    end

  end

  describe "GET /edit" do
    it "should show edit" do
      get :edit, params: { id: 1 }
      expect(response).to render_template("edit")
      expect(response.status).to eq(200)
    end
  end

  describe "PATCH /update" do
    before do
      @music_params = { name:"GG", artist:"EZ" }
    end

    it "data added should be correct" do
      patch :update , params: { id: 1, music: @music_params }   
      expect(@music_params[:name]).to eq(Music.last[:name])
      expect(response.status).to eq(302)
    end 

    it "should redirect to show/id path" do
      patch :update , params: { id: 1, music: @music_params }
      expect(response).to redirect_to(:action => :show , :id => assigns(:music).id)
      expect(response.status).to eq(302)
    end

    it "data sould not be added" do
      expect {
        patch :update , params: { id: 1, music: { name:"", artist:"1234" } }
      }.to_not change(Music, :count) 
      expect(response.status).to eq(422)   
    end
  end

  describe "DELETE /destroy" do
    it "data should be deleted" do
      expect{ delete :destroy, params:{id:1} }.to change(Music, :count).by(-1)
      expect(Music.where(id:1).first).to eq(nil)
      expect(response.status).to eq(302)
    end
  end
end
