class Devise::Oauth2Providable::AuthorizationCode < Devise::Oauth2Providable::BaseToken
  expires_according_to :authorization_code_expires_in
end
