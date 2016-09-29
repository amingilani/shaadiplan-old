# <!-- BEGIN MODEL ANNOTATION -->
# ## Schema Information
#
# Table name: `weddings`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#
# <!-- END MODEL ANNOTATION -->

class Wedding < ApplicationRecord
  has_many :guests
end
