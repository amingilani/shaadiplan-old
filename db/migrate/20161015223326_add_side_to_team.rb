class AddSideToTeam < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :side, :integer
  end
end
