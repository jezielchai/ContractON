class Contractor < ActiveRecord::Base
  attr_accessible :firstName, :lastName, :password, :email, :profession
  has_secure_password

  validates :firstName, presence: true, length: { maximum:50 }
  validates :lastName, presence: true, length: { maximum:50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, :on=> :create, length: { minimum: 6 }
  validates :profession, presence: true

  before_save :create_remember_token
  
 def self.search(search)
    if search
       find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
       find(:all)
    end
 end 

  private
  def create_remember_token
  self.remember_token = SecureRandom.urlsafe_base64
end

end
