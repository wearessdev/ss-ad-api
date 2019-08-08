# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.string :caption
      t.string :file

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
