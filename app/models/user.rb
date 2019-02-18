class User < ApplicationRecord
	#bcrypt password hash
  has_secure_password

  mount_uploader :avatar, AvatarUploader

#make sure email is present and unique
  validates :email, presence: true, uniqueness: true

#Google omni auth code
 has_many :authentications, dependent: :destroy

 def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     username: auth_hash["info"]["name"],
     email: auth_hash["info"]["email"],
     password: SecureRandom.hex(10) 
     #assign random password to omniauth created accounts
   )
    user.remote_avatar_url = auth_hash["info"]["image"]
   user.save
   user.authentications << authentication
   return user
 end

 # grab google to access google for user data
 def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
 end
end
