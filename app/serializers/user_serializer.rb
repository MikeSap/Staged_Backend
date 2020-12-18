class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :username, :city, :bands, :followed
    # has_many :followed
    # has_many :bands
    
    def bands      
      object.bands.map do |band|
      BandSerializer.new(band)
      end
    end

    def followed
      object.followed.map do |band|
        BandSerializer.new(band)
        end
    end

  end
  