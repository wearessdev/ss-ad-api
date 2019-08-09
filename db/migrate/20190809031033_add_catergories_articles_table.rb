class AddCatergoriesArticlesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_categories, id: false do |t|
      t.belongs_to :article, index: true
      t.belongs_to :category, index: true
    end
  end
end
