# frozen_string_literal: true

json.total_pages @total_pages

json.events do
  json.array! @article, partial: "article", as: :event, short_version: true
end
