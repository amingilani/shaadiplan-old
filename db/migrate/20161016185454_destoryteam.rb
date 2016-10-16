# frozen_string_literal: true
class Destoryteam < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key 'guests', 'teams'
    remove_foreign_key 'guests', 'weddings'
    remove_foreign_key 'relationships', 'teams'
    remove_foreign_key 'relationships', 'users'
    remove_foreign_key 'teams', 'weddings'
    drop_table :relationships
    drop_table :teams
  end
end
