class Posting < ActiveRecord::Base
belongs_to :company

  attr_accessible :city, :description, :duration, :requirements, :salary, :state, :title, :zipcode
end
