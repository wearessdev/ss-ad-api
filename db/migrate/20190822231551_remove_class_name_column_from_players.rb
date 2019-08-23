class RemoveClassNameColumnFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :class_name
    add_column    :players, :year, :string
  end
end
