# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'json'

resource 'Schools' do
  explanation "Schools Resource"

  get '/api/v1/schools/:id.json' do
    let(:school) { FactoryGirl.create(:school) }
    let(:id) { school.id }
    context '200' do
      example_request 'Getting Staff Member by ID' do
        expect(status).to eq(200)
      end
    end
  end

  post '/api/v1/schools.json' do
    with_options with_example: true do
      parameter :name, required: true
      parameter :address, required: true
      parameter :city, required: true
      parameter :state, required: true
      parameter :zip, required: true
    end

    context '201' do
      example "Create a School" do
        request = {
          name: "Callaway High School",
          address: "Somewhere In Jackson MS",
          city: "Jackson",
          state: "MS",
          zip: 39206
        }

        do_request(request)

        expect(status).to eq(201)
      end
    end
  end

  get '/api/v1/schools.json' do
    context '200' do
      example_request 'Getting All Schools' do
        expect(status).to eq(200)
      end
    end
  end

  delete '/api/v1/schools/:id.json' do
    let(:school) { FactoryGirl.create(:school) }
    let(:id) { school.id }
    context '200' do
      example_request 'Delete School by ID' do
        expect(status).to eq(200)
      end
    end
  end
end
