# frozen_string_literal: true

json.extract! event, :id, :name, :description, :date, :location, :likes, :loves, :created_at, :updated_at, :deleted_at
# json.url event_url(event, format: :json)
