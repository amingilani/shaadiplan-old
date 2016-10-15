# frozen_string_literal: true
# ## Schema Information
#
# Table name: `relationships`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`user_id`**     | `integer`          |
# **`team_id`**     | `integer`          |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`title`**       | `integer`          |
#
# ### Indexes
#
# * `index_relationships_on_team_id`:
#     * **`team_id`**
# * `index_relationships_on_user_id`:
#     * **`user_id`**
#
# ### Foreign Keys
#
# * `fk_rails_678d19535f`:
#     * **`team_id => teams.id`**
# * `fk_rails_a3d77c3b00`:
#     * **`user_id => users.id`**
#

class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :title, presence: true

  enum title: {
    father:      1,
    mother:      2,
    brother:     3,
    sister:      4,
    friend:      5,
    cousin:      6,
    aunt:        7,
    uncle:       8,
    grandmother: 9,
    grandfather: 10
  }
end
