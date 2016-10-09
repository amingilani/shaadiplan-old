class AddNameToWeddings < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :name, :string, null: false, unique: true
  end
end
