class Item < ApplicationRecord
  belongs_to :order , optional: true

end
