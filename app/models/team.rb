# <!-- BEGIN MODEL ANNOTATION -->
# ## Schema Information
#
# Table name: `teams`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`color`**       | `integer`          |
# **`wedding_id`**  | `integer`          |
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
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
# <!-- END MODEL ANNOTATION -->

class Team < ApplicationRecord
  belongs_to :wedding
end
