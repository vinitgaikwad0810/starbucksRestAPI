class Order < ApplicationRecord
  has_many  :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true, update_only: true

end
