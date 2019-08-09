# frozen_string_literal: true

json.total_pages @total_pages

json.events do
  json.array! @events, partial: "event", as: :event, short_version: true
end
