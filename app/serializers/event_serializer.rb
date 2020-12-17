class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :url, :event_type, :band, :comments
  belongs_to :band
  has_many :comments

  # def comments
  #   object.comments.map do |com|
  #   CommentSerializer.new(com)
  #   end
  # end

end
