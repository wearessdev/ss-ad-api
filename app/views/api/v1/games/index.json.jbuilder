# frozen_string_literal: true

json.total_pages @total_pages

json.games do
  json.array! @games, partial: "game", as: :game, short_version: true
end
