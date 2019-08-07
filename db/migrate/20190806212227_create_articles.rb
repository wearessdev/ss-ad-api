# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string      :name
      t.references  :school, :author, foreign_key: true
      t.string      :content
      t.boolean     :is_published
      t.datetime    :publish_date
      t.integer     :likes, default: 0
      t.integer     :loves, default: 0
      t.string      :thumbnail

      t.timestamps
    end
  end
end
