class Item < ApplicationRecord
  belongs_to  :order
 # belongs_to :order , inverse_of: items
end
