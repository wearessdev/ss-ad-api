# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string      :name
      t.string      :description
      t.datetime    :date
      t.string      :location
      t.integer     :likes, default: 0
      t.integer     :loves, default: 0
      t.references  :school, foreign_key: true

      t.timestamps
    end
  end
end
