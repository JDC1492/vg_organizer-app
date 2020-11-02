class User < ApplicationRecord

  has_many :games
  has_many :consoles, through: :games

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

        def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.name = auth.info.name
            user.username = auth.info.username
            user.uid = auth.uid
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
          end
        end

end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable