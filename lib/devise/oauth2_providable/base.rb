class Devise::Oauth2Providable::Base
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Validations
end
