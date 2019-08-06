class DeleteAuthTokenColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :auth_token, :int
  end
end
