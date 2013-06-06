class Devise::Oauth2Providable::Base < ParentClass
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Validations
end
