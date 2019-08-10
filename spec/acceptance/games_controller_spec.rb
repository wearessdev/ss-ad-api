# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'json'

resource 'Games' do
  explanation "Games Resource"

  get '/api/v1/games/:id.json' do
    let(:game) { FactoryGirl.create(:game) }
    let(:id) { game.id }
    context '200' do
      example_request 'Getting Game by ID' do
        expect(status).to eq(200)
      end
    end
  end

  post '/api/v1/teams/:id/games.json' do
    # header "Content-Type", "application/json"
    let(:season) { FactoryGirl.create(:season) }
    let(:id) { season.team_id }

    with_options with_example: true do
      parameter :date, required: true
      parameter :opponent, required: true
      parameter :location, required: true
      parameter :home_away, required: true
      parameter :win
      parameter :loss
      parameter :score
      parameter :school_id, required: true
      parameter :team_id, required: true
      parameter :season_id, required: true
    end

    context '201' do
      example "Create a Game" do
        request = {
          date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"),
          opponent: "The Other Guys",
          location: "Our House",
          home_away: "home",
          win: true,
          loss: false,
          score: "50-10",
          school_id: season.school_id,
          team_id: season.team_id,
          season_id: season.id
        }

        do_request(request)

        expect(status).to eq(201)
      end
    end
  end

  # get '/api/v1/teams/:id.json' do
  #   header "Content-Type", "application/json"
  #   context '200' do
  #     let(:id) { team.id }
  #     example_request 'Getting Team By ID' do
  #       expect(status).to eq(200)
  #     end
  #   end
  # end
  #
  # delete '/api/v1/teams/:id.json' do
  #   header "Content-Type", "application/json"
  #   context '200' do
  #     let(:id) { team.id }
  #     example_request 'Deleting Team By ID' do
  #       expect(status).to eq(200)
  #     end
  #   end
  # end
  #
  # get '/api/v1/teams/:id/players.json' do
  #   header "Content-Type", "application/json"
  #   context '200' do
  #     let(:id) { team.id }
  #     example_request 'Returning Players on Team' do
  #       expect(status).to eq(200)
  #     end
  #   end
  # end
  #
  # get '/api/v1/teams/:id/staffs.json' do
  #   header "Content-Type", "application/json"
  #   context '200' do
  #     let(:id) { team.id }
  #     example_request 'Returning Staff Members on Team' do
  #       expect(status).to eq(200)
  #     end
  #   end
  # end
  #
  # get '/api/v1/teams/:id/games.json' do
  #   header "Content-Type", "application/json"
  #   context '200' do
  #     let(:game) { FactoryGirl.create(:game, school: school, team: team, season: season) }
  #     let(:id) { game.team_id }
  #     example_request 'Returning Games for Team' do
  #       expect(status).to eq(200)
  #     end
  #   end
  # end
  #
  # get '/api/v1/teams/:id/seasons.json' do
  #   header "Content-Type", "application/json"
  #   context '200' do
  #     let(:id) { team.id }
  #     example_request 'Returning Seasons for Team' do
  #       expect(status).to eq(200)
  #     end
  #   end
  # end
end
