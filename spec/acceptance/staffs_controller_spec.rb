# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'json'

resource 'Staffs' do
  explanation "Staffs Resource"

  get '/api/v1/staffs/:id.json' do
    let(:staff) { FactoryGirl.create(:staff) }
    let(:id) { staff.id }
    context '200' do
      example_request 'Getting Staff Member by ID' do
        expect(status).to eq(200)
      end
    end
  end

  post '/api/v1/teams/:id/staffs.json' do
    let(:team) { FactoryGirl.create(:team) }
    let(:id) { team.id }

    with_options with_example: true do
      parameter :first_name, required: true
      parameter :last_name, required: true
      parameter :title, required: true
      parameter :email, required: true
      parameter :phone, required: true
    end

    context '201' do
      example "Create a Staff Member" do
        request = {
          first_name: "Coach",
          last_name: "Test",
          title: "Assistant Coach to the Assistant",
          email: "testcoach@testng.com",
          phone: "321-456-7580"
        }

        do_request(request)

        expect(status).to eq(201)
      end
    end
  end
end
