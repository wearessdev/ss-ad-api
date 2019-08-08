# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string  :first_name
      t.string  :last_name
      t.references :school, :team, foreign_key: true
      t.integer :team_id
      t.integer :jersey_number
      t.string  :position
      t.string  :height
      t.string  :weight
      t.string  :class_name

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
