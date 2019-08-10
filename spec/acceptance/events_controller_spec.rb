# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Events' do
  explanation "Events Resource"

  let(:school) { FactoryGirl.create(:school) }
  let(:time)   { DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M") }
  let(:event)  { FactoryGirl.create(:event, school: school) }

  get '/api/v1/events.json' do
    context '200' do
      example_request 'Getting All Events' do
        expect(status).to eq(200)
      end
    end
  end

  post '/api/v1/events.json' do
    with_options with_example: true do
      parameter :name, 'Name of Event <str>', required: true
      parameter :description, 'Short Description of Event <str>', required: true
      parameter :date, 'Date of event <dateTimeStr>', required: true
      parameter :location, 'Location of Event <str>', required: true
      parameter :school_id, 'School ID of Event <int>', required: true
    end
    context '201' do
      example "Create an Event" do
        request = {
          name: "Test Event",
          description: "Event Description",
          date: time,
          school_id: school.id,
          location: "1234 We Are Sports Social Ave"
        }

        do_request(request)

        expect(status).to eq(201)
      end
    end
  end

  get 'api/v1/events/:id.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:id) { event.id }
      example_request 'Getting Event By ID' do
        expect(status).to eq(200)
      end
    end
  end

  delete 'api/v1/events/:id.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:id) { event.id }
      example_request 'Deleting Event By ID' do
        expect(status).to eq(200)
      end
    end
  end

  patch 'api/v1/events/:id/like.json' do
    context '200' do
      let(:id) { event.id }
      example_request 'Liking Event By ID' do
        expect(status).to eq(200)
      end
    end
  end

  patch 'api/v1/events/:id/love.json' do
    context '200' do
      let(:id) { event.id }
      example_request 'Loving Event By ID' do
        expect(status).to eq(200)
      end
    end
  end

  patch 'api/v1/events/:id/dislike.json' do
    context '200' do
      let(:id) { event.id }
      example_request 'Disliking Event By ID' do
        expect(status).to eq(200)
      end
    end
  end

  patch 'api/v1/events/:id/dislove.json' do
    context '200' do
      let(:id) { event.id }
      example_request 'Disloving Event By ID' do
        expect(status).to eq(200)
      end
    end
  end
end
