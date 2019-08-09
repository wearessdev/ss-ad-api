# frozen_string_literal: true

json.id             article.id
json.name           article.name
json.is_published   article.is_published
json.publish_date   article.publish_date
json.likes          article.likes
json.loves          article.loves
json.author do
  json.partial! '/api/v1/authors/author', author: article.author, short_version: true
end

unless defined?(short_version)
  json.categories article.categories do |category|
    json.partial! "/api/v1/categories/category", category: category
  end
  json.images article.images do |image|
    json.partial! "/api/v1/images/image", image: image
  end
  json.created_at   article.created_at
  json.updated_at   article.updated_at
  json.deleted_at   article.deleted_at if !article.deleted_at.nil?
  json.content      article.content
end
