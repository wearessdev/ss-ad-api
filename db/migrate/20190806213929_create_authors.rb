class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :image
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
