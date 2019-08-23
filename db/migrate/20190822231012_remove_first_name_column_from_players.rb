# frozen_string_literal: true

class RemoveFirstNameColumnFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :first_name
    remove_column :players, :last_name
    add_column    :players, :name, :string
  end
end
