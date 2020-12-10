class User < ApplicationRecord

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    has_many :connections
    has_many :followed, foreign_key: :followed_id, class_name: "Connection"
    has_many :comments
    has_many :band_members
    has_many :bands, through: :band_members

end
