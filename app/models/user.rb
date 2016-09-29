require 'auth0'

class User
  include ActiveModel::Model

  def initialize
    auth0_api.user
  end

  private

  def auth0_api
    Auth0Client.new(
      client_id: Rails.application.secrets.auth0_client_id,
      token: Rails.application.secrets.auth0_management_jwt,
      domain: Rails.application.secrets.auth0_domain,
      api_version: '2'
    )
  end
end
