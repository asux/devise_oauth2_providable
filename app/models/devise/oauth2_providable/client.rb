class Devise::Oauth2Providable::Client < Devise::Oauth2Providable::Base
  field :name
  field :redirect_uri
  field :website
  field :identifier
  field :secret

  index({identifier: 1}, {unique: true, background: true})

  has_many :access_tokens, class_name: 'Devise::Oauth2Providable::AccessToken'
  has_many :refresh_tokens, class_name: 'Devise::Oauth2Providable::RefreshToken'
  has_many :authorization_codes, class_name: 'Devise::Oauth2Providable::AuthorizationCode'

  before_validation :init_identifier, on: :create, unless: :identifier?
  before_validation :init_secret, on: :create, unless: :secret?
  validates :website, :secret, presence: true
  validates :name, presence: true, uniqueness: true
  validates :identifier, presence: true, uniqueness: true

  attr_accessible :name, :website, :redirect_uri

  private

  def init_identifier
    self.identifier = Devise::Oauth2Providable.random_id
  end

  def init_secret
    self.secret = Devise::Oauth2Providable.random_id
  end
end
