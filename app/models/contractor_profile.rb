class ContractorProfile < ActiveRecord::Base
  attr_accessible :address, :city, :degree, :interests, :lat, :length, :license, :lng, :major, :salary, :school, :skills, :state, :website, :work, :zipcode
end
