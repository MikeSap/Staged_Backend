class Band < ApplicationRecord
    has_many :connections
    has_many :followers, foreign_key: :follower_id, class_name: "Connection"
    has_many :band_members
    has_many :members, foreign_key: :user_id, through: :band_members
    has_many :events
    has_many :comments, through: :events
end
