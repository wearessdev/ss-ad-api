class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string    :name
      t.references :school, foreign_key: true
      t.string    :sport
      t.string    :thumbnail
      t.string    :twitter_url
      t.string    :facebook_url
      t.string    :instagram_url

      t.timestamps
    end
  end
end
