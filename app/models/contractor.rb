class Contractor < ActiveRecord::Base
has_one :contractor_profiles
attr_accessible :firstName, :lastName, :password, :email
has_secure_password  
  
  validates :firstName, presence: true, length: { maximum:50 }
  validates :lastName, presence: true, length: { maximum:50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, :on=> :create, length: { minimum: 6 }

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
 
	
  def self.fname_search(search)
	 search_condition = "%#{search}%"
    if search
       find(:all, :conditions => ['firstName LIKE ?', search_condition])
         else
       find(:all)
   end
  end	

   def self.lname_search(search)
	 search_condition = "%#{search}%"
    if search
       find(:all, :conditions => ['lastName LIKE ?', search_condition])
    else
       find(:all)
    end
   end
   
   def self.email_search(search)
	 search_condition = "%#{search}%"
    if search
       find(:all, :conditions => ['email LIKE ?', search_condition])
    else
       find(:all)
    end
  end

  private
  def create_remember_token
  self.remember_token = SecureRandom.urlsafe_base64
end

end
