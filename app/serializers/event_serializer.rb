class EventSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :date, :url, :event_type, :comments, :band, :photo
  # belongs_to :band

  def band
    object.band.attributes.merge(photo: rails_blob_path(object.band.photo, only_path: true) )
  end
  
  def comments
    object.comments.map do |com|
    CommentSerializer.new(com)
    end
  end
    
  def photo
      rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end

end
