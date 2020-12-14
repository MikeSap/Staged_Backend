class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :url, :event_type
end
