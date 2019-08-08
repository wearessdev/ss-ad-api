# frozen_string_literal: true

json.id             article.id
json.name           article.name
json.author         article.author
json.is_published   article.is_published
json.publish_date   article.publish_date
json.likes          article.likes
json.loves          article.loves
# json.category       article.category
json.content        article.content
json.created_at     article.created_at
json.updated_at     article.updated_at

json.deleted_at article.deleted_at if !article.deleted_at.nil?

# json.images article.images do |image|
#   json.partial! "images/image", image: image
# end
