class AddInvitedByToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :invited_by, :string
    add_reference :guests, :team, foreign_key: true
  end
end
