class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :lockable, :invitable,
         :omniauthable, omniauth_providers: [:google_oauth2, :github, :twitter]

    include Roleable

    def self.from_omniauth(access_token)
        data = access_token.info
        user = User.where(email: data['email']).first
        unless user
            user = User.create(
               email: data['email'],
               password: Devise.friendly_token[0,20]
            )
        end

        user.provider = access_token.provider
        user.uid = access_token.uid
        unless user.name.present?
            user.name = access_token.info.name
        end
        user.image = access_token.info.image
        user.save
        user.confirmed_at = Time.now
      user
    end

    # Assign a default role callback as 'student':
    after_create do   
        self.update(admin: true)
    end

    def to_s
        email 
    end

end
