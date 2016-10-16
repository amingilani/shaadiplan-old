class CreateOrganizers < ActiveRecord::Migration[5.0]
  def change
    create_table :organizers do |t|
      t.integer :relationship
      t.integer :side
      t.references :wedding, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
