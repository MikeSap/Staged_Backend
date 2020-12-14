class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :url, :event_type, :band
  belongs_to :band
end
