class User < ApplicationRecord
  authenticates_with_sorcery!
  
  before_save { self.email = self.email.downcase }
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :nickname, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 3 }
  #has_secure_password

  validates_confirmation_of :password
  #validates_presence_of :password, :on => :create
  #validates_presence_of :email
  #validates_uniqueness_of :email
  #validates_presence_of :nickname
  #validates_uniqueness_of :nickname
end
