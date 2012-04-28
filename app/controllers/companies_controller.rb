class CompaniesController < ApplicationController
  def signup
      @company = Company.new
  end

    def create
	  @company = Company.new(params[:company])
        if @company.save
		sign_in @company
		flash[:success] = "Welcome to ContractON!"
	  redirect_to @company
	else
		render 'new'
  end
  end

  def show
	  @Company =Company.find(params[:id])
  end

  def search
     @Company = Company.search(params[:search])    
    # @Contractor = Contractor.all :conditions => {:profession => params[:profession]}
    # @Contractor = Contractor.find(params[:search])    
    # @Contractor = Contractor.all :conditions => {:profession => params[:profession]}
	 @companies = Contractor.search(params[:search])
	 
	 
  end
  def index
	   @company =Contractor.find_by_firstName(params[:search])
>>>>>>> 3bf3c5b9e3637cb55b5c288f016faa995bff513b
  end
end

