class RenameUserTeamTableToRelationship < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_teams, :relationships
  end
end
