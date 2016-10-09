class RenameAuth0UsersTableToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :auth0_users, :users
  end
end
