class AddDetailsToWedding < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :bride_name, :string, null: false
    add_column :weddings, :groom_name, :string, null: false
  end
end
