# frozen_string_literal: true

json.id           school.id
json.name         school.name
json.city         school.city
json.address      school.address

unless defined?(short_version)
  json.created_at school.created_at
  json.updated_at   school.updated_at
  json.deleted_at   article.deleted_at if !article.deleted_at.nil?
end
