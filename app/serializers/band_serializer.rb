class BandSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :url, :bio
  has_many :users
  has_many :events
end
