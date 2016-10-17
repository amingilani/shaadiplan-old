# frozen_string_literal: true
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
# **`address`**     | `text`             | `not null`
# **`phone`**       | `string`           |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`invited_by`**  | `string`           |
# **`side`**        | `integer`          | `not null`
#
# ### Indexes
#
# * `index_guests_on_wedding_id`:
#     * **`wedding_id`**
#

class Guest < ApplicationRecord
  belongs_to :wedding

  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :invited_by, presence: true

  enum side: %w(
    bride
    groom
  )
end
