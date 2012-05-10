class Posting < ActiveRecord::Base
belongs_to :company
has_many :opinions
  attr_accessible :city, :description, :duration, :requirements, 
  				  :salary, :state, :title, :zipcode, :company_id


 def self.posting_search(search)
	 search_condition = "%#{search}%"
	 
    if search
       find(:all, :conditions => ['company_id LIKE ?', search_condition])
    else
       find(:all)
    end
	

 end

end
