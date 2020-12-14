class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :username, :city, :bands
    has_many :followed
    has_many :bands
  end
  