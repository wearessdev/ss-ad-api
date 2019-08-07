class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :year_start
      t.integer :year_end
      t.references :school, :team, foreign_key: true

      t.timestamps
    end
  end
end
