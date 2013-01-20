class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :username
  
  has_many :authentications, dependent: :destroy
  
  validates :username, presence: true, uniqueness: true

  def validate_password?
    password.present? || password_confirmation.present?
  end
  
  has_secure_password
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.username = auth["info"]["nickname"]
      # Set a random string as password
      user.password = (0...8).map{65.+(rand(26)).chr}.join
      user.authentications.new(provider: auth["provider"], uid: auth["uid"])
    end
  end
end
