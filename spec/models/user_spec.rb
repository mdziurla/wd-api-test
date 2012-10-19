require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  
  it "is invalid without an email" do
    FactoryGirl.build(:user, :email => nil).should_not be_valid
  end
  
  it "is invalid without a password" do
    FactoryGirl.build(:user, :password => nil).should_not be_valid
  end
    
  it "is invalid without a first name" do
    FactoryGirl.build(:user, :first_name => nil).should_not be_valid
  end
  
  it "is invalid without a last name" do
    FactoryGirl.build(:user, :last_name => nil).should_not be_valid
  end
    
  it "has a valid authentication token" do
    user = FactoryGirl.create(:user)
    user.authentication_token.should_not == nil
  end
  
  it "returns a user's full name as a string" do
    user = FactoryGirl.create(:user, :first_name => "John", :last_name => "Doe")
    user.full_name.should == "John Doe"
  end
end
