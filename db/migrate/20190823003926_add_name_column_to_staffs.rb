# frozen_string_literal: true

class AddNameColumnToStaffs < ActiveRecord::Migration[5.2]
  def change
    remove_column :staffs, :first_name
    remove_column :staffs, :last_name
    add_column :staffs, :name, :string
  end
end
