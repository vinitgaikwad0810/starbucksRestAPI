FactoryGirl.define do
  factory :item do |i|
    i.name "latte"
    i.quantity 1
    i.milk "whole"
    i.size "small"
  end
end