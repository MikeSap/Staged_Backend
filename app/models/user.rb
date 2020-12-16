class User < ApplicationRecord

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :email, uniqueness: { case_sensitive: false }

    has_many :connections

    has_many :follows, foreign_key: :follower_id, class_name: "Connection"
    has_many :followed, through: :follows, source: :followed

    
    has_many :comments, foreign_key: :user_id
    
    has_many :band_members
    has_many :bands, through: :band_members

end