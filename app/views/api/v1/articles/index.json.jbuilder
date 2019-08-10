# frozen_string_literal: true

json.total_pages @total_pages

json.articles do
  json.array! @article, partial: "article", as: :article, short_version: true
end
