# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'json'

resource 'Users' do
  explanation "Users Resource"

  get '/api/v1/users/:id.json' do
    let(:user) { FactoryGirl.create(:user) }
    let(:id) { user.id }
    context '200' do
      example 'Getting User by ID' do
        user.token = FactoryGirl.create(:token, user: user)
        do_request

        expect(status).to eq(200)
      end
    end
  end

  post '/api/v1/users.json' do
    let(:school) { FactoryGirl.create(:school) }

    with_options with_example: true do
      parameter :name, required: true
      parameter :address, required: true
      parameter :city, required: true
      parameter :state, required: true
      parameter :zip, required: true
    end

    context '201' do
      example "Create a User" do
        request = {
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password: "This is a long password",
          school_id: school.id
        }

        do_request(request)
        expect(status).to eq(201)
      end
    end
  end

  get '/api/v1/users.json' do
    context '200' do
      example_request 'Getting All Users' do
        expect(status).to eq(200)
      end
    end
  end

  delete '/api/v1/users/:id.json' do
    let(:user) { FactoryGirl.create(:user) }
    let(:id) { user.id }
    context '200' do
      example 'Delete User by ID' do
        user.token = FactoryGirl.create(:token, user: user)

        do_request
        expect(status).to eq(200)
      end
    end
  end
end
