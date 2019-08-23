# frozen_string_literal: true

class AddTimeColumnToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :time, :string
  end
end
