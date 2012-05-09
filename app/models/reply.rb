class Reply < ActiveRecord::Base
  attr_accessible :company_id, :content, :contractor_id, :created_at, :opinion_id, :updated_at
end
