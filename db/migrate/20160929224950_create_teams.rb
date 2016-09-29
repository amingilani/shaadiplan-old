class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :color
      t.references :wedding, foreign_key: true

      t.timestamps
    end
  end
end
