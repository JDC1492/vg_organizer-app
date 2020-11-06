class User < ApplicationRecord
    has_many :games
    has_many :consoles, through: :games
      validates :username, uniqueness: true
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
            user.password = Devise.friendly_token[0,20]
          end
        end


        # def console_attributes=(console_attributes)
        #   console_attributes.values.each do |console_attribute|
        #       console = Console.find_or_create_by(console_attribute)
        #       self.consoles << console
        #   end
        #   end

end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable