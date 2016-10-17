class FixGuestAssociations < ActiveRecord::Migration[5.0]
  def change
    remove_column :guests, :team_id
    add_column :guests, :side, :integer, null: false
    change_column :guests, :address, :text, null:false
  end
end
