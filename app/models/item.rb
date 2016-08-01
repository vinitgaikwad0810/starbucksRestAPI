class Item < ApplicationRecord
  belongs_to :order , optional: true
  validates :name, :quantity, :milk, :size, :presence => true
end
