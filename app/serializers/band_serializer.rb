class BandSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :url, :bio, :events
  has_many :events

  # def events
  #   object.events.map do |e|
  #   EventSerializer.new(e)
  #   end
  # end
  
end
