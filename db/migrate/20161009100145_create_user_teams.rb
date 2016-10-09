class CreateUserTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :user_teams do |t|
      t.references :user, foreign_key: true, index: true
      t.references :team, foreign_key: true, index: true

      t.timestamps
    end
  end
end
