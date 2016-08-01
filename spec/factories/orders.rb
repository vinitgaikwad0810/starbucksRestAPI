FactoryGirl.define do
  factory :order do |o|
  	o.id 100
    o.location "takeAway"
    o.status "preparing"
  end
end