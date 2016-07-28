class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :milk, :size
end
