class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :city
  has_many :followed, :bands
end
