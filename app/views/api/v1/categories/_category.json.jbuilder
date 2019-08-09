# frozen_string_literal: true

json.id category.id
json.name category.name

unless defined?(short_version)
  json.created_at category.created_at
  json.updated_at category.updated_at
  json.deleted_at category.deleted_at if !category.deleted_at.nil?
end
