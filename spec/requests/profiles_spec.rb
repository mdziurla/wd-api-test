require 'spec_helper'

describe "Profiles" do
  describe "fetching the list of profiles" do
    it "works! (now write some real specs)" do
      get "/api/v1/profiles.json"
      response.status.should be(200)
    end
  end
end
