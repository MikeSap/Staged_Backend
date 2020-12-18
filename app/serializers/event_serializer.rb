class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :url, :event_type, :comments, :band
  belongs_to :band

  def comments
    object.comments.map do |com|
    CommentSerializer.new(com)
    end
  end

end
