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
# **`bride_name`**  | `string`           | `not null`
# **`groom_name`**  | `string`           | `not null`
#

class Wedding < ApplicationRecord
  before_validation :set_name

  has_many :organizers
  has_many :users, through: :organizer

  # The full names of the couple
  def couple_names
    [bride_name, groom_name]
  end

  # The first names of the couple
  def couple_first_names
    couple_names.map { |e| e.split(' ').first }
  end

  private

  def set_name
    self.name = "#{couple_first_names.map(&:downcase).join('-')}-#{rand 10_000}"
  end
end
