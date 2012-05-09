class Opinion < ActiveRecord::Base
  attr_accessible :company_id, :content, :contractor_id, :created_at, :posting_id, :updated_at
end
