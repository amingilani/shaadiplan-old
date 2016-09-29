# <!-- BEGIN MODEL ANNOTATION -->
# ## Schema Information
#
# Table name: `guests`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`weddings_id`**  | `integer`          |
# **`name`**         | `string`           |
# **`email`**        | `string`           |
# **`address`**      | `string`           |
# **`phone`**        | `string`           |
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_guests_on_weddings_id`:
#     * **`weddings_id`**
#
# ### Foreign Keys
#
# * `fk_rails_32dcd7bc76`:
#     * **`weddings_id => weddings.id`**
#
# <!-- END MODEL ANNOTATION -->

class Guest < ApplicationRecord
  belongs_to :weddings
end
