require 'spec_helper'
require 'factory_girl_rails'
#FactoryGirl.find_definitions

describe Item do
  it "has a valid factory" do
  FactoryGirl.create(:item).should be_valid
end
  it "is invalid without a name" do
  FactoryGirl.build(:item, name: nil, quantity: 1, milk: "whole", size: "small").should_not be_valid
end  
  it "is invalid without a quantity specified" do
  FactoryGirl.build(:item, name: "latte", quantity: nil, milk: "whole", size: "small").should_not be_valid
end
 it "is invalid without a milk type specified" do
  FactoryGirl.build(:item, name: "latte", quantity: 1, milk: nil, size: "small").should_not be_valid
end
it "is invalid without a size specified" do
  FactoryGirl.build(:item, name: "latte", quantity: 1, milk: "whole", size: nil).should_not be_valid
end
end