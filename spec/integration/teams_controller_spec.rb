# frozen_string_literal: true

require 'swagger_helper'
require 'rails_helper'

describe 'Teams Controller' do
  let(:school) { FactoryGirl.create(:school) }

  # Create Test
  path '/api/v1/teams.json' do
    post 'Create a Team' do
      tags 'Teams'
      consumes 'application/json'
      parameter name: :team, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          sport: { type: :string },
          thumbnail: { type: :string },
          twitter_url: { type: :string },
          facebook_url: { type: :string },
          instagram_url: { type: :string }
        }
      }

      response '201', 'Team Created' do
        let(:team) { FactoryGirl.create(:team) }
        run_test!
      end
    end
  end

  # Index Test
  path '/api/v1/teams' do
    get 'Get All Teams' do
      tags 'Teams'
      produces 'application/json'

      response '200', 'Teams Returned' do
        run_test!
      end
    end
  end

  # Show Test
  path '/api/v1/teams/{id}' do
    get 'Get Team By ID' do
      tags 'Teams'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Team Returned' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 sport: { type: :string },
                 thumbnail: { type: :string },
                 twitter_url: { type: :string },
                 facebook_url: { type: :string },
                 instagram_url: { type: :string }
               }
        let(:id) { FactoryGirl.create(:team).id }
        run_test!
      end
    end
  end

  # Delete Test
  path '/api/v1/teams/{id}' do
    delete 'Delete Team By ID' do
      tags 'Teams'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Team Deleted' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 sport: { type: :string },
                 thumbnail: { type: :string },
                 twitter_url: { type: :string },
                 facebook_url: { type: :string },
                 instagram_url: { type: :string },
                 deleted_at: { type: :string }
               }
        let(:id) { FactoryGirl.create(:team).id }
        run_test!
      end
    end
  end

  # Index Team Players Test
  path '/api/v1/teams/{id}/players' do
    get 'Get All Team Players' do
      tags 'Teams'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Players Returned' do
        let(:id) { FactoryGirl.create(:team).id }
        run_test!
      end
    end
  end

  # Index Team Staff Test
  path '/api/v1/teams/{id}/staffs' do
    get 'Get All Team Staff' do
      tags 'Teams'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Staff Returned' do
        let(:id) { FactoryGirl.create(:team).id }
        run_test!
      end
    end
  end

  # Index Team Staff Test
  path '/api/v1/teams/{id}/games' do
    get 'Get All Team Games' do
      tags 'Teams'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Games Returned' do
        let(:id) { FactoryGirl.create(:team).id }
        run_test!
      end
    end
  end

  # Index Team Staff Test
  path '/api/v1/teams/{id}/seasons' do
    get 'Get All Team Seasons' do
      tags 'Teams'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Seasons Returned' do
        let(:id) { FactoryGirl.create(:team).id }
        run_test!
      end
    end
  end
end
