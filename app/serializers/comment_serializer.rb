class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :event_id, :content, :created_at

  def user
    u = User.find(object.user_id)
  end

end
