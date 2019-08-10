# frozen_string_literal: true

json.id         game.id
json.date       game.date
json.opponent   game.opponent
json.location   game.location
json.home_away  game.home_away

unless defined?(short_version)
  json.win        game.win
  json.loss       game.loss
  json.score      game.score
  json.school_id  game.season.team.school_id
  json.team_id    game.season.team.id
  json.season_id  game.season_id
end
