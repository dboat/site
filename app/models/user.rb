class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :phone, :password, :password_confirmation
  has_secure_password
  before_save :create_remember_token
  
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: valid_email_regex }
  
  validates :phone, presence: true, uniqueness: true
  
  validates :password, length: { minimum: 6 }
  
  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
