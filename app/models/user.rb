class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :validatable,:omniauthable, :omniauth_providers => [:google_oauth2]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@ntq-solution.com.vn/i

  before_create: validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.fullname = auth.info.name
          user.pictures = auth.info.image
      end
  end

end
