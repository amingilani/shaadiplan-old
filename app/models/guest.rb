# ## Schema Information
#
# Table name: `guests`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`wedding_id`**  | `integer`          |
# **`name`**        | `string`           |
# **`email`**       | `string`           |
# **`address`**     | `string`           |
# **`phone`**       | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`invited_by`**  | `string`           |
# **`team_id`**     | `integer`          |
#
# ### Indexes
#
# * `index_guests_on_team_id`:
#     * **`team_id`**
# * `index_guests_on_wedding_id`:
#     * **`wedding_id`**
#

class Guest < ApplicationRecord
  belongs_to :wedding
  belongs_to :team
end
