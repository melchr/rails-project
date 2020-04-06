class User < ApplicationRecord
  devise :omniauthable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauth_providers => [:google_oauth2]
  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end
end
