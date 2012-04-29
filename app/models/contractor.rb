class Contractor < ActiveRecord::Base
  attr_accessible :firstName, :lastName, :password, :email, :profession
  has_secure_password

  validates :firstName, presence: true, length: { maximum:50 }
  validates :lastName, presence: true, length: { maximum:50 }
  validates :email, presence: true
  validates :password, :on=> :create, length: { minimum: 6 }
  validates :profession, presence: true

  before_save :create_remember_token
  
 def self.profession_search(search)
	 search_condition = "%#{search}%"
	 
    if search
       find(:all, :conditions => ['profession LIKE ?', search_condition])
    else
       find(:all)
    end
	

 end 
  def self.name_search(search)
	 search_condition = "%#{search}%"
	 
    if search
       find(:all, :conditions => ['lastName || firstName LIKE ?', search_condition])
    else
       find(:all)
    end
	

 end 

  private
  def create_remember_token
  self.remember_token = SecureRandom.urlsafe_base64
end

end
