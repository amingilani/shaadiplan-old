# frozen_string_literal: true
# ## Schema Information
#
# Table name: `teams`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`wedding_id`**  | `integer`          |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`name`**        | `string`           |
# **`side`**        | `integer`          |
#
# ### Indexes
#
# * `index_teams_on_wedding_id`:
#     * **`wedding_id`**
#
# ### Foreign Keys
#
# * `fk_rails_08b347071b`:
#     * **`wedding_id => weddings.id`**
#

class Team < ApplicationRecord
  belongs_to :wedding
  has_many :relationships
  has_many :users, through: :relationships

  validates :name, presence: true

  enum side: %w(bride groom)
end
