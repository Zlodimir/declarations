class User < ActiveRecord::Base
  # :token_authenticatable, :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  validates :username, presence: true
  validates_uniqueness_of :username, scope: :provider, case_sensitive: false

  has_many :declarations

  def self.from_omniauth(auth, omniauth_params)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth_email(auth)
      user.username = auth_username(auth)
      user.password = Devise.friendly_token[0,20]
    end
  end

  private

  def self.auth_username(auth)
    case auth.provider
    when 'facebook', 'twitter', 'google', 'vkontakte', 'mailru'
      auth.info.name
    end
  end

  def self.auth_email(auth)
    case auth.provider
    when 'facebook', 'google', 'vkontakte', 'mailru'
      auth.info.email
    when 'twitter'
      "#{auth.info.name}@twitter.com"
    end
  end
end
