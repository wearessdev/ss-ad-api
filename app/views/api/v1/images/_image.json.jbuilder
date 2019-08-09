# frozen_string_literal: true

json.id         image.id
json.name       image.name
json.caption    image.caption
json.file       image.file
json.created_at image.created_at
json.updated_at image.updated_at
json.deleted_at image.deleted_at if !image.deleted_at.nil?
