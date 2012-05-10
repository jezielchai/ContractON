class Company < ActiveRecord::Base
  attr_accessible :industry, :name, :password, :link
  
  has_many :postings

  validates :name, presence: true, length: { maximum:50 }
  validates :industry, presence: true, length: { maximum:50 }
  validates :password, :on=> :create, length: { minimum: 6 }


  before_save :create_remember_token

  private 

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
  def self.name_conditions(name)
    find(:all, :conditions => ['name LIKE ?', "%#{name}%"]) unless name.blank?
  end

  def self.industry_conditions(industry)
      find(:all, :conditions => ['industry LIKE ?', "%#{industry}%"]) unless industry.blank?
  end
  
  def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end

    
end
