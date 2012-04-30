class Company < ActiveRecord::Base
  attr_accessible :industry, :name, :password
  has_secure_password

  validates :name, presence: true, length: { maximum:50 }
  validates :industry, presence: true, length: { maximum:50 }
  validates :password, :on=> :create, length: { minimum: 6 }


  before_save :create_remember_token
  
 def self.industry_search(search)
	 search_condition = "%#{search}%"
	 
    if search
<<<<<<< HEAD

   find(:all, :conditions => ['first_name LIKE ? || last_name LIKE ?', "%#{search}%", "%#{search}%"])
    else
     find(:all)
  end
=======
       find(:all, :conditions => ['industry LIKE ?', search_condition])
    else
       find(:all)
    end
	

 end 
  def self.name_search(search)
	 search_condition = "%#{search}%"
	 
    if search
       find(:all, :conditions => ['name LIKE ?', search_condition])
    else
       find(:all)
    end
	

>>>>>>> 067f9cba143f01c3faa9ee15f5f3a71785df085f
 end 

  private 

    def create_remember_token
	    self.remember_token = SecureRandom.urlsafe_base64
    end
end
