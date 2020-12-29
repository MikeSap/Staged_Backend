class Event < ApplicationRecord
  
    belongs_to :band
    has_many :comments

    has_one_attached :photo, dependent: :destroy
    validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

end
