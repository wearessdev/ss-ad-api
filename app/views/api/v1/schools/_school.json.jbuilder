# frozen_string_literal: true

json.id           school.id
json.name         school.name
json.address      school.address
json.city         school.city
json.state        school.state
json.zip          school.zip

unless defined?(short_version)
  json.created_at   school.created_at
  json.updated_at   school.updated_at
  json.deleted_at   school.deleted_at if !school.deleted_at.nil?
end
