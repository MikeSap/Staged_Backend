class Event < ApplicationRecord
    belongs_to :band
    has_many :comments

    has_one_attached :photo
end
