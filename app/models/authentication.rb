class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :provider, :uid
  
  scope :from_omniauth, ->(auth) { where(provider: auth["provider"]).where(uid: auth["uid"]) }
end
