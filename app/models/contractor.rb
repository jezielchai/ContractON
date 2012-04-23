class Contractor < ActiveRecord::Base
  attr_accessible :firstName, :lastName, :password, :email, :profession
  has_secure_password

  validates :firstName, presence: true, length: { maximum:50 }
  validates :lastName, presence: true, length: { maximum:50 }
  validates :email, presence: true
  validates :password, :on=> :create, length: { minimum: 6 }
  validates :profession, presence: true

  before_save :create_remember_token

  private
  def create_remember_token
  self.remember_token = SecureRandom.urlsafe_base64
end

end
