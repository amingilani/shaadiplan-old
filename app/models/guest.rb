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
#
# ### Indexes
#
# * `index_guests_on_wedding_id`:
#     * **`wedding_id`**
#
# ### Foreign Keys
#
# * `fk_rails_32dcd7bc76`:
#     * **`wedding_id => weddings.id`**
#

class Guest < ApplicationRecord
  belongs_to :wedding
end
