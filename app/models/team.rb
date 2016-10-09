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
  has_many :user_teams
  has_many :users, through: :user_teams

  validates :name, presence: true
end
