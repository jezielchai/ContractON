class Company < ActiveRecord::Base
  attr_accessible :industry, :name, :password
  has_secure_password

  validates :name, presence: true, length: { maximum:50 }
  validates :industry, presence: true, length: { maximum:50 }
  validates :password, :on=> :create, length: { minimum: 6 }


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
