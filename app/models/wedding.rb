# frozen_string_literal: true
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
# **`name`**        | `string`           | `not null`
#

class Wedding < ApplicationRecord
  has_many :guests
  has_many :teams

  # The full names of the couple
  def couple
    teams.map(&:name)
  end

  # The first names of the couple
  def couple_first_names
    couple.map { |e| e.split(' ').first }
  end
end
