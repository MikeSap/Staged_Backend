class Band < ApplicationRecord

    validates :name, uniqueness: { case_sensitive: false }
    validates :url, uniqueness: { case_sensitive: false }
    validates :name, :url, :bio, presence: true

    has_many :follows, foreign_key: :followed_id, class_name: "Connection"
    has_many :followers, through: :follows, source: :follower

    has_many :band_members
    has_many :users, through: :band_members, foreign_key: :user_id
    has_many :events
    has_many :comments, through: :events

    has_one_attached :photo

end
