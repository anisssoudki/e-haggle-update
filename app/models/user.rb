class User < ApplicationRecord
    has_one_attached :image
    before_save { self.email = email.downcase }
    has_many :products, dependent: :destroy
    # has_many :comments, dependent: :destroy
    validates :username, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGEX }
    has_secure_password 
    acts_as_voter
    has_many :comments, dependent: :destroy

    # here is where we can abstract a bunch of logins for different providers but because this project is taking a lot of time i wont be doing it at this time
#     def self.from_omniauth(auth)
#     user = find_or_create_by(uid: facebook_params['uid'], provider: facebook_params['provider']) do |user|
#     user.username = facebook_params['info']['name']
#     user.image_url = facebook_params['info']['image']
#     user.oauth_token = facebook_params['credentials']['token']
#     user.oauth_expires_at = Time.at(facebook_params['credentials']['expires_at'])
#     user.save!
#     user
#   end   
# end    
end
