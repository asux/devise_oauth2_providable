class Devise::Oauth2Providable::Base
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Validations

  store_in collection: :oauth2

  class << self
    def method_missing(method, *args)
      method.to_s.match(/^find_by_(\w+)$/) do |m|
        attribute = m[1].to_sym
        return find_by(attribute => args.first)
      end
      super
    end

    def respond_to?(method, *args)
      method.to_s.starts_with?('find_by_') or super
    end
  end
end
