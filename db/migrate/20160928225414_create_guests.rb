class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.references :weddings, foreign_key: true
      t.string :name
      t.string :email
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
