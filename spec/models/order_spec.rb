require 'spec_helper'
require 'factory_girl_rails'
#FactoryGirl.find_definitions

describe Order do
  it "has a valid factory" do
  FactoryGirl.create(:order).should be_valid
end
  it "is invalid without a location" do
  FactoryGirl.build(:order, location: nil).should_not be_valid
end  
  it "is invalid without a status" do
  FactoryGirl.build(:order, location: nil).should_not be_valid
end
 
end