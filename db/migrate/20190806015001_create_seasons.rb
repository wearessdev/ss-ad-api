# frozen_string_literal: true

class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :year_start
      t.integer :year_end
      t.references :school, :team, foreign_key: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
