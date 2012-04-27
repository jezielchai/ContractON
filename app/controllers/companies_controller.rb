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
    # @Contractor = Contractor.find(params[:search])    
    # @Contractor = Contractor.all :conditions => {:profession => params[:profession]}
	 @companies = Company.search(params[:search])
	 redirect_to @companies
  end
  def index
	   @Company =Company.find(params[:search])
  end
end

