class Company < ActiveRecord::Base
  attr_accessible :industry, :name, :password

  before_save :create_remember_token
  
  def self.search(search)
    if search
   find(:all, :conditions => ['first_name LIKE ? || last_name LIKE ?', "%#{search}%", "%#{search}%"])
    else
     find(:all)
  end
 end 

  private 

    def create_remember_token
	    self.remember_token = SecureRandom.urlsafe_base64
    end
end
