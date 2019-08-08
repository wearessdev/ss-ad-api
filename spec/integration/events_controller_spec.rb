# frozen_string_literal: true

require 'swagger_helper'
require 'rails_helper'

describe 'Events Controller' do
  let(:school) { FactoryGirl.create(:school) }
  let(:author) { FactoryGirl.create(:author, school: school) }

  # Create Test
  path '/api/v1/events.json' do
    post 'Create an Aritcle' do
      tags 'Events'
      consumes 'application/json'
      parameter name: :event, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          date: { type: :string },
          school_id: { type: :integer },
          location: { type: :string },
          likes: { type: :integer },
          loves: { type: :integer }
        }
      }

      response '201', 'Event Created' do
        let(:event) {
          {
            name: "Test Event",
            description: "Test Description",
            date: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"),
            school_id: FactoryGirl.create(:school).id,
            location: "This is a location",
            likes: 0,
            loves: 0
          }
        }
        run_test!
      end
    end
  end

  # Index Test
  path '/api/v1/events' do
    get 'Get All Events' do
      tags 'Events'
      produces 'application/json'

      response '200', 'events returned' do
        run_test!
      end
    end
  end

  # Show Test
  path '/api/v1/events/{id}' do
    get 'Get Event By ID' do
      tags 'Events'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'event returned' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 date: { type: :string },
                 school_id: { type: :integer },
                 location: { type: :string },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:event).id }
        run_test!
      end
    end
  end

  # Delete Test
  path '/api/v1/events/{id}' do
    delete 'Delete Event By ID' do
      tags 'Events'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'event returned' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 date: { type: :string },
                 school_id: { type: :integer },
                 location: { type: :string },
                 likes: { type: :integer },
                 loves: { type: :integer },
                 deleted_at: { type: :string }
               }
        let(:id) { FactoryGirl.create(:event).id }
        run_test!
      end
    end
  end

  # Like Test
  path '/api/v1/events/{id}/like.json' do
    patch "Like an Event by id" do
      tags 'Events'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'event liked' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 date: { type: :string },
                 school_id: { type: :integer },
                 location: { type: :string },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:event).id }
        run_test!
      end
    end
  end

  # Love Test
  path '/api/v1/events/{id}/love.json' do
    patch "Love an Event by id" do
      tags 'Events'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'event loved' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 date: { type: :string },
                 school_id: { type: :integer },
                 location: { type: :string },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:event).id }
        run_test!
      end
    end
  end

  # Dislike Test
  path '/api/v1/events/{id}/dislike.json' do
    patch "Dislike an Event by id" do
      tags 'Events'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'event loved' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 date: { type: :string },
                 school_id: { type: :integer },
                 location: { type: :string },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:event).id }
        run_test!
      end
    end
  end

  # Dislove Test
  path '/api/v1/events/{id}/dislove.json' do
    patch "Dislove an Event by id" do
      tags 'Events'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'event loved' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 date: { type: :string },
                 school_id: { type: :integer },
                 location: { type: :string },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:event).id }
        run_test!
      end
    end
  end
end
