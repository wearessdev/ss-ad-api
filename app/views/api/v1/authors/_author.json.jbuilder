# frozen_string_literal: true

json.id     author.id
json.name   author.name
json.email  author.email
json.image  author.image

unless defined?(short_version)
  json.school_id  author.school_id
  json.created_at author.created_at
  json.updated_at author.updated_at
  json.deleted_at author.deleted_at
end
