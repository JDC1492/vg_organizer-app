class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    has_many :games
    has_many :consoles, through: :games
      validates :username, uniqueness: true
      validates :username, presence: true
      validates :email, uniqueness: true
      validates :email, presence: true
      validates_confirmation_of :password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

        def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.name = auth.info.name
            user.username = auth.info.nickname
            user.uid = auth.uid
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]  #set pword to a random string so github users can log in to the application
          end
        end

end