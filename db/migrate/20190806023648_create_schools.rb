# frozen_string_literal: true

class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
