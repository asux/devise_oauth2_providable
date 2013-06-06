class Devise::Oauth2Providable::BaseToken < Devise::Oauth2Providable::Base
  field :token, type: String
  field :expires_at: type: DateTime

  index({token: 1}, {unique: true, background: true})
  index({expires_at: 1}, {background: true})

  belongs_to :user
  belongs_to :client
end
