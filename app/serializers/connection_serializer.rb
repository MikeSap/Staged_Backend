class ConnectionSerializer < ActiveModel::Serializer
    attributes :band

    def band
        b = Band.find(object.followed_id)
        BandSerializer.new(b)
    end

    # def user
    #     u = User.find(object.follower_id)
    #     UserSerializer.new(u)
    # end
  end
  