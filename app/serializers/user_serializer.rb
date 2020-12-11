class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :username, :city
    has_many :followed
    has_many :bands
  end
  