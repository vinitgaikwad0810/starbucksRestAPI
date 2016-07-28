class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :recipient_id, :body
end
