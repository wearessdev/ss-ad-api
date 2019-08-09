class RemoveArticlesFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :articles_id
  end
end
