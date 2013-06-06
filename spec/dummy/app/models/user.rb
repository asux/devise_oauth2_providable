class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Validations

  field :email
  field :encrypted_password
  devise :database_authenticatable, :oauth2_providable, :oauth2_password_grantable, :oauth2_refresh_token_grantable, :oauth2_authorization_code_grantable
end
