# frozen_string_literal: true
# ## Schema Information
#
# Table name: `organizers`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`id`**            | `integer`          | `not null, primary key`
# **`relationship`**  | `integer`          |
# **`side`**          | `integer`          |
# **`wedding_id`**    | `integer`          | `not null`
# **`user_id`**       | `integer`          | `not null`
# **`created_at`**    | `datetime`         | `not null`
# **`updated_at`**    | `datetime`         | `not null`
#
# ### Indexes
#
# * `index_organizers_on_user_id`:
#     * **`user_id`**
# * `index_organizers_on_wedding_id`:
#     * **`wedding_id`**
#
# ### Foreign Keys
#
# * `fk_rails_03c9fbf0a2`:
#     * **`user_id => users.id`**
# * `fk_rails_8f62a15760`:
#     * **`wedding_id => weddings.id`**
#

class Organizer < ApplicationRecord
  belongs_to :wedding
  belongs_to :user

  enum side: %w(
    bride
    groom
  )

  enum relationship: %w(
    father
    mother
    brother
    sister
    friend
    cousin
    aunt
    uncle
    grandmother
    grandfather
    self
  )

  def relationship
    return "The #{self[:side].upcase_first}" if self[:relationship] == 'self'
    "#{self[:relationship].upcase_first} of the #{self[:side].upcase_first}"
  end
end
