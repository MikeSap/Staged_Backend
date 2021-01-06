class BandMember < ApplicationRecord    

    validates :user_id, uniqueness: {scope: :band_id, message: "User cannot be in the same band twice"}

    belongs_to :band
    belongs_to :user

end
