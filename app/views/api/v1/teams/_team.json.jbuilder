# frozen_string_literal: true

json.id               team.id
json.name             team.name
json.thumbnail        team.thumbnail

unless defined?(short_version)
  json.twitter_url team.twitter_url
  json.facebook_url     team.facebook_url
  json.instagram_url    team.instagram_url
  json.created_at       team.created_at
  json.updated_at       team.updated_at
  json.deleted_at       team.deleted_at if !team.deleted_at.nil?
end
