# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'json'

resource 'Teams' do
  explanation "Teams Resource"

  get '/api/v1/teams.json' do
    context '200' do
      example_request 'Getting All Teams' do
        expect(status).to eq(200)
      end
    end
  end

  post '/api/v1/teams.json' do
    let(:school) { FactoryGirl.create(:school) }
    with_options with_example: true do
      parameter :name, required: true
      parameter :sport, required: true
      parameter :thumbnail, required: true
      parameter :school_id, required: true
      parameter :twitter_url
      parameter :facebook_url
      parameter :instagram_url
    end

    context '201' do
      example "Create a Team" do
        request = {
          name: "Test Team",
          sport: "Basketball",
          thumbnail: "path-to-img",
          school_id: school.id,
          twitter_url: "url-to-twitter",
          facebook_url: "url-to-facebook",
          instagram_url: "url-to-instagram"
        }

        do_request(request)

        expect(status).to eq(201)
      end
    end
  end

  get '/api/v1/teams/:id.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:team) { FactoryGirl.create(:team) }
      let(:id) { team.id }
      example_request 'Getting Team By ID' do
        expect(status).to eq(200)
      end
    end
  end

  delete '/api/v1/teams/:id.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:team) { FactoryGirl.create(:team) }
      let(:id) { team.id }
      example_request 'Deleting Team By ID' do
        expect(status).to eq(200)
      end
    end
  end

  get '/api/v1/teams/:id/players.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:player) { FactoryGirl.create(:player) }
      let(:id) { player.team_id }
      example_request 'Returning Players on Team' do
        expect(status).to eq(200)
      end
    end
  end

  get '/api/v1/teams/:id/staffs.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:staff) { FactoryGirl.create(:staff) }
      let(:id) { staff.team_id }
      example_request 'Returning Staff Members on Team' do
        expect(status).to eq(200)
      end
    end
  end

  get '/api/v1/teams/:id/games.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:game) { FactoryGirl.create(:game) }
      let(:id) { game.season.team_id }
      example_request 'Returning Games for Team' do
        expect(status).to eq(200)
      end
    end
  end

  get '/api/v1/teams/:id/seasons.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:season) { FactoryGirl.create(:season) }
      let(:id) { season.team_id }
      example_request 'Returning Seasons for Team' do
        expect(status).to eq(200)
      end
    end
  end
end
