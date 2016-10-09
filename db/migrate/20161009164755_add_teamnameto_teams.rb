class AddTeamnametoTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :name, :string, index:true
    remove_column :teams, :color
  end
end
