class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :phone
      t.references :school, :team, foreign_key: true

      t.timestamps
    end
  end
end
