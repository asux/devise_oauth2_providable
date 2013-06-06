class Devise::Oauth2Providable::RefreshToken < Devise::Oauth2Providable::BaseToken
  expires_according_to :refresh_token_expires_in

  attr_accessible :access_tokens

  has_many :access_tokens, class_name: 'Devise::Oauth2Providable::AccessToken'
end
