class Company < ActiveRecord::Base
  attr_accessible :industry, :name, :password

  before_save :create_remember_token
  
  def self.search(search)
    if search
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
    else
     find(:all)
  end
 end 

  private 

    def create_remember_token
	    self.remember_token = SecureRandom.urlsafe_base64
    end
end
