# frozen_string_literal: true

json.array! @categories, partial: "category", as: :category, short_version: true
