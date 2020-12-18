class BandSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :url, :bio, :events
  has_many :events
  
end
