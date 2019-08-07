json.id             article.id
json.name           article.name
json.author         article.author
json.is_published   article.is_published
json.publish_date   article.publish_date
json.likes          article.likes
json.loves          article.loves
json.category       article.category
json.content        article.content

json.images article.images do |image|
  json.partial! "images/image", image: image
end
