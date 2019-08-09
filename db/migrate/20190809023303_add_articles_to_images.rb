class AddArticlesToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :articles, foreign_key: true
  end
end
