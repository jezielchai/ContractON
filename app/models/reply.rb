class Reply < ActiveRecord::Base
belongs_to :company
  attr_accessible :company_id, :content, :contractor_id, :created_at, :opinion_id, :updated_at
end
