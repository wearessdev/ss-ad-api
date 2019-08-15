# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Articles" do
  explanation "Articles Resource"

  let(:school)  { FactoryGirl.create(:school) }
  let(:author)  { FactoryGirl.create(:author, school: school) }
  let(:time)    { DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M") }
  let(:article) { FactoryGirl.create(:article, school: school, author: author) }

  get '/api/v1/articles.json' do
    context '200' do
      example_request 'Getting All Articles' do
        expect(status).to eq(200)
      end
    end
  end

  post '/api/v1/articles.json' do
    with_options with_example: true do
      parameter :name, 'The name of the Aritcle', required: true
      parameter :content, required: true
      parameter :is_published, required: true
      parameter :publish_date
      parameter :school_id, required: true
      parameter :author_id, required: true
    end
    context '201' do
      example "Create an Article" do
        request = {
          name: "Test Article",
          content: "Article Content",
          is_published: true,
          publish_date: time,
          school_id: school.id,
          author_id: author.id
        }

        do_request(request)

        expect(status).to eq(201)
      end
    end
  end

  get 'api/v1/articles/:id.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:id) { FactoryGirl.create(:article).id }
      example_request 'Getting Article By ID' do
        expect(status).to eq(200)
      end
    end
  end

  delete 'api/v1/articles/:id.json' do
    header "Content-Type", "application/json"
    context '200' do
      let(:id) { article.id }
      example_request 'Deleting Article By ID' do
        expect(status).to eq(200)
      end
    end
  end

  patch 'api/v1/articles/:id/like.json' do
    context '200' do
      let(:id) { article.id }
      example_request 'Liking Article By ID' do
        expect(status).to eq(200)
      end
    end
  end

  patch 'api/v1/articles/:id/love.json' do
    context '200' do
      let(:id) { article.id }
      example_request 'Loving Article By ID' do
        expect(status).to eq(200)
      end
    end
  end

  patch 'api/v1/articles/:id/dislike.json' do
    context '200' do
      let(:id) { article.id }
      example_request 'Disliking Article By ID' do
        expect(status).to eq(200)
      end
    end
  end

  patch 'api/v1/articles/:id/dislove.json' do
    context '200' do
      let(:id) { article.id }
      example_request 'Disloving Article By ID' do
        expect(status).to eq(200)
      end
    end
  end
end
