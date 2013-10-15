class Devise::Oauth2Providable::Base
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Validations

  def default_collection_name
    "oauth2_#{super}"
  end
end
