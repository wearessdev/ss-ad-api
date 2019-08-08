# frozen_string_literal: true

class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string     :user_id
      t.string     :token

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :tokens, :user_id, unique: true
    add_index :tokens, :token, unique: true
  end
end
