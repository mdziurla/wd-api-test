require 'spec_helper'

describe Api::V1::ProfilesController do
  describe "GET index" do
    it "populates an array of profiles" do
      profile = FactoryGirl.create(:user)
      get :index
      assigns(:profiles).should eq([profile])
    end
    
    it "renders the json response for @profiles" do
      profiles = FactoryGirl.create(:user, :first_name => "John", :last_name => "Doe", :hobby => "diving")
      get :index
      JSON.parse(response.body).should == {"profiles" => [{"first_name" => "John", "last_name" => "Doe", "hobby" => "diving"}]}
      response.status.should be(200)
    end
  end
  
  describe "GET show" do
    before :each do
      @profile = FactoryGirl.create(:user, :first_name => "John", :last_name => "Doe", :hobby => "diving")
      get :show, :id => @profile
    end
    
    it "assigns the requested profile to @profile" do
      assigns(:profile).should eq(@profile)      
    end
    
    it "renders the json response for @profile" do
      JSON.parse(response.body).should == {"profile" => {"first_name" => "John", "last_name" => "Doe", "hobby" => "diving"}}
    end
    
    it "returns response status 200" do
      response.status.should be(200)
    end
  end
  
  describe "DELETE destroy" do
    before :each do
      @profile = FactoryGirl.create(:user)
    end
    
    context "valid auth token" do
      it "deletes the profile" do
        expect{
          delete :destroy, {:id => @profile, :auth_token => @profile.authentication_token}
        }.to change(User, :count).by(-1)
      end

      it "renders the json response" do
        delete :destroy, {:id => @profile, :auth_token => @profile.authentication_token}
        JSON.parse(response.body).should == {"success" => true, "message" => "User profile was successfully deleted"}
      end

      it "returns response status 200" do
        delete :destroy, {:id => @profile, :auth_token => @profile.authentication_token}
        response.status.should be(200)
      end      
    end
    
    context "invalid auth token" do
      it "returns response status 302" do
        delete :destroy, :id => @profile
        response.status.should be(302)
      end
    end
  end
end