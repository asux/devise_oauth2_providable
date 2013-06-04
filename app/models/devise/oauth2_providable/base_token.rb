class Devise::Oauth2Providable::BaseToken
  include Mongoid::Document

  field :token, type: String
  field :expires_at: type: DateTime
  field :created_at: type: DateTime
  field :updated_at: type: DateTime
  belongs_to :user
  belongs_to :client
end
