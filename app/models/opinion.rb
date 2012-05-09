class Opinion < ActiveRecord::Base
belongs_to :company
belongs_to :contractor
has_many :replies
  attr_accessible :company_id, :content, :contractor_id, :created_at, :posting_id, :updated_at
end
