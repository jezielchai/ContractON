class ContractorProfile < ActiveRecord::Base
has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
belongs_to :contractor

  attr_accessible :address, :city, :degree, :interests, :lat, :length, :license, :lng, :major, :salary, :school, :skills, :state, :website, :work, :zipcode, :profession, :avatar
end
