class CreateAuth0Users < ActiveRecord::Migration[5.0]
  def change
    create_table :auth0_users do |t|
      t.string :auth0_id, null:false

      t.timestamps
    end
  end
end
