class User < ActiveRecord::Base
  # :token_authenticatable, :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  validates :username, presence: true
  validates_uniqueness_of :username, scope: :provider, case_sensitive: false

  def self.from_omniauth(auth, omniauth_params)
    Rails.logger.debug("EBAT!!!!!!!!!!!#{auth}")
    Rails.logger.debug("EBAT!!!!!!!!!provider!!#{auth.provider}")
    Rails.logger.debug("EBAT!!!!!!!!!!!!!!!auth uid #{auth.uid}")
    Rails.logger.debug("EBAT!!!!!!!!!!!!!!!auth_username(auth) #{auth_username(auth)}")
    Rails.logger.debug("EBAT!!!!!!!!!!!!!!!auth_email(auth) #{auth_email(auth)}")
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth_email(auth)
      user.username = auth_username(auth)
      user.password = Devise.friendly_token[0,20]
    end
  end

  # def email_required?
  #   false
  # end 

  private

  def self.auth_username(auth)
    case auth.provider
    when 'facebook', 'twitter', 'google', 'vkontakte'
      auth.info.name
    end
  end

  def self.auth_email(auth)
    case auth.provider
    when 'facebook', 'google', 'vkontakte'
      auth.info.email
    when 'twitter'
      "#{auth.info.name}@twitter.com"
    end
  end
end
