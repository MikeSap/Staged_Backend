class BandSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :url, :bio, :users, :events
  has_many :users
  has_many :events
end
