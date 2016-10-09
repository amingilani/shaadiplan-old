class ChangeWeddingstoWeddingsinGuests < ActiveRecord::Migration[5.0]
  def change
    rename_column :guests, :weddings_id, :wedding_id
  end
end
