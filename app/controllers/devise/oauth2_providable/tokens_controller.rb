class Devise::Oauth2Providable::TokensController < ApplicationController
  before_filter :clear_user
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, only: :create

  def create
    @refresh_token = oauth2_current_refresh_token || oauth2_current_client.refresh_tokens.create!(user: current_user)
    @access_token = @refresh_token.access_tokens.create!(client: oauth2_current_client, user: current_user)
    render json: @access_token.token_response
  end

  private

  def oauth2_current_client
   env[Devise::Oauth2Providable::CLIENT_ENV_REF]
  end

  def oauth2_current_refresh_token
    env[Devise::Oauth2Providable::REFRESH_TOKEN_ENV_REF]
  end

  # Clear user in warden proxy to force resolve winning strategy
  # and authenticate using Oauth2AuthorizationCodeGrantTypeStrategy
  def clear_user
    warden.set_user(nil) if warden.user.present?
  end
end
