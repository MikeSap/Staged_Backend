class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :event_id, :content

  def user
    u = User.find(object.user_id)
  end

end
