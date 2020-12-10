class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :content
end
