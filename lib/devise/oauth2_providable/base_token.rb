class Devise::Oauth2Providable::BaseToken < Devise::Oauth2Providable::Base
  field :token
  field :expires_at, type: Time
  field :user_id
  field :client_id

  index({token: 1}, {unique: true, background: true})
  index({expires_at: 1}, {background: true})

  belongs_to :user
  belongs_to :client, class_name: 'Devise::Oauth2Providable::Client'
end
