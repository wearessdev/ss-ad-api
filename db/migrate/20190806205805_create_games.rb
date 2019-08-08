# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime    :date
      t.string      :opponent
      t.string      :location
      t.string      :home_away
      t.boolean     :win
      t.boolean     :loss
      t.string      :score
      t.references :school, :team, :season, foreign_key: true

      t.datetime   :deleted_at
      t.timestamps
    end
  end
end
