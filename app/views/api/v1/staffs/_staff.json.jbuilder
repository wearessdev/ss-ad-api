# frozen_string_literal: true

json.id               staff.id
json.first_name       staff.first_name
json.last_name        staff.last_name
json.title            staff.title
json.email            staff.email
json.phone            staff.phone

unless defined? short_version
  json.created_at staff.created_at
  json.updated_at       staff.updated_at
  json.deleted_at       staff.deleted_at if !staff.deleted_at.nil?
end
