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
           keyward = params[:keywards]
	   if keyward == '3'
	  @companies = Contractor.profession_search(params[:search])
	   
	   end
	 
	    if keyward =='1'
	  @companies = Contractor.name_search(params[:search])
	    end
  end

  def index
         keyward = params[:keywards]
       
         if keyward == '3'
	  @company = Contractor.profession_search(params[:search])
	  flash.now[:error] = 'Search Contractors by Profession'
	   end
	 if keyward == '1'
	  @company = Contractor.name_search(params[:search])
	  flash.now[:error] = 'Search Contractors by Name'
	   end
	 if keyward == '2'
	  @company = Contractor.location_search(params[:search])
	  flash.now[:error] = 'Search Contractors by Location'
	   end  
	if keyward == '4'
	  @company = Contractor.contractlength_search(params[:search])
	  flash.now[:error] = 'Search Contractors by Contractlenghtn'
	   end  
  end

end
