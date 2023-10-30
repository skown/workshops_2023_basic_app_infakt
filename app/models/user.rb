class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :book_loans, dependent: :destroy
  has_many :book_reservations, dependent: :destroy

  
  def self.from_omniauth(access_token)
  
    user = find_or_initialize_by(provider: access_token.provider, email: access_token.info.email)
      user.provider = access_token.provider
      user.uid = access_token.uid
      user.email = access_token.info.email
      user.password = Devise.friendly_token[0, 20]
      user.token = access_token.credentials.token
      user.refresh_token = access_token.credentials.refresh_token
      user.save!

      return user
  end
  
 """   
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(
       email: data['email'],
       password: Devise.friendly_token[0,20]
      )
    end
    user
  """  
  
  

end
