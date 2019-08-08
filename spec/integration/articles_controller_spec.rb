# frozen_string_literal: true

require 'swagger_helper'
require 'rails_helper'

describe 'Articles Controller' do
  let(:school) { FactoryGirl.create(:school) }
  let(:author) { FactoryGirl.create(:author, school: school) }

  # Create Test
  path '/api/v1/articles.json' do
    post 'Create an Aritcle' do
      tags 'Articles'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          content: { type: :string },
          is_published: { type: :boolean },
          publish_date: { type: :string },
          school_id: { type: :integer },
          author_id: { type: :integer },
          likes: { type: :integer },
          loves: { type: :integer }
        }
      }

      response '201', 'Article Created' do
        let(:article) { { name: "Test Article", content: "Article Content", is_published: true, publish_date: "12/31/2012", school_id: school.id, author_id: author.id } }
        run_test!
      end
    end
  end

  # Index Test
  path '/api/v1/articles' do
    get 'Get All Articles' do
      tags 'Articles'
      produces 'application/json'

      response '200', 'articles returned' do
        run_test!
      end
    end
  end

  # Show Test
  path '/api/v1/articles/{id}' do
    get 'Get Article By ID' do
      tags 'Articles'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'article returned' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 content: { type: :string },
                 is_published: { type: :boolean },
                 publish_date: { type: :string },
                 school_id: { type: :integer },
                 author_id: { type: :integer },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:article).id }
        run_test!
      end
    end
  end

  # Delete Test
  path '/api/v1/articles/{id}' do
    delete 'Delete Article By ID' do
      tags 'Articles'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'article returned' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 content: { type: :string },
                 is_published: { type: :boolean },
                 publish_date: { type: :string },
                 school_id: { type: :integer },
                 author_id: { type: :integer },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:article).id }
        run_test!
      end
    end
  end

  # Like Test
  path '/api/v1/articles/{id}/like.json' do
    patch "Like an Article by id" do
      tags 'Articles'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'article liked' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 content: { type: :string },
                 is_published: { type: :boolean },
                 publish_date: { type: :string },
                 school_id: { type: :integer },
                 author_id: { type: :integer },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:article).id }
        run_test!
      end
    end
  end

  # Love Test
  path '/api/v1/articles/{id}/love.json' do
    patch "Love an Article by id" do
      tags 'Articles'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'article loved' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 content: { type: :string },
                 is_published: { type: :boolean },
                 publish_date: { type: :string },
                 school_id: { type: :integer },
                 author_id: { type: :integer },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:article).id }
        run_test!
      end
    end
  end

  # Dislike Test
  path '/api/v1/articles/{id}/dislike.json' do
    patch "Dislike an Article by id" do
      tags 'Articles'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'article loved' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 content: { type: :string },
                 is_published: { type: :boolean },
                 publish_date: { type: :string },
                 school_id: { type: :integer },
                 author_id: { type: :integer },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:article).id }
        run_test!
      end
    end
  end

  # Dislove Test
  path '/api/v1/articles/{id}/dislove.json' do
    patch "Dislove an Article by id" do
      tags 'Articles'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'article loved' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 content: { type: :string },
                 is_published: { type: :boolean },
                 publish_date: { type: :string },
                 school_id: { type: :integer },
                 author_id: { type: :integer },
                 likes: { type: :integer },
                 loves: { type: :integer }
               }
        let(:id) { FactoryGirl.create(:article).id }
        run_test!
      end
    end
  end
end
