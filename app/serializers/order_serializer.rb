class OrderSerializer < ActiveModel::Serializer
  attributes :id, :location, :status, :items
end
