class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :username, :city, :bands
    has_many :followed
    has_many :bands
    
    # def bands
    #   object.bands.map do |band|
    #   BandSerializer.new(band)
    #   end
    # end

  end
  