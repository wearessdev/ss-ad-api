# frozen_string_literal: true

json.id           event.id
json.name         event.name
json.description  event.description
json.date         event.date
json.location     event.location
json.likes        event.likes
json.loves        event.loves
json.images       event.images do |image|
  json.partial! "/api/v1/images/image", image: image
end

unless defined?(short_version)
  json.created_at   event.created_at
  json.updated_at   event.updated_at
  json.deleted_at   event.deleted_at if !event.deleted_at.nil?
end
