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
# * `fk_rails_64c25f3fe6`:
#     * **`team_id => teams.id`**
# * `fk_rails_978858c8ea`:
#     * **`user_id => users.id`**
#

class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :team
end