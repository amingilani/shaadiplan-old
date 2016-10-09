# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`auth0_id`**    | `string`           | `not null`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
#

class User < ApplicationRecord
  after_initialize :set_instance_variables

  has_many :user_teams
  has_many :teams, through: :user_teams
  has_many :weddings, through: :teams

  validates :auth0_id, presence: true,
                       uniqueness: true

  def info(key = nil)
    key.nil? ? @user : @user[key.to_s]
  end

  private

  def set_instance_variables
    @user ||= auth0_api.user auth0_id
  end

  def auth0_api
    Auth0Client.new(
      client_id: Rails.application.secrets.auth0_client_id,
      token: Rails.application.secrets.auth0_management_jwt,
      domain: Rails.application.secrets.auth0_domain,
      api_version: 2
    )
  end
end
