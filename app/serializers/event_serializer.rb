class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :link, :type
end
