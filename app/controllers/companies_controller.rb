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
def showall
	@company = Company.all
end

      
  def show

	  @company = Company.find(params[:id])
	  @posting = Posting.posting_search(params[:id])

  end

def edit
    @company = Company.find(params[:id])
   end

   def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @company
      redirect_to @company
    else
      render 'edit'
    end
  end

  def search
        @contractors = Contractor.paginate(page:params[:page])
       
	  @companies = Contractor.name_search(params[:search])
	
	  @companies = Contractor.profession_search(params[:search])
	 
  end

  def index
         keyward = params[:keywards]
	 if keyward == '1'
	  @company = Contractor.name_search(params[:search])
	  flash.now[:success] = 'Search Contractors by Name'
	   end
	 if keyward == '2'
	  @company = Contractor.location_search(params[:search])
	  flash.now[:success] = 'Search Contractors by Location'
	 end
	 if keyward == '3'
	  @company = Contractor.profession_search(params[:search])
	  flash.now[:success] = 'Search Contractors by Profession'
	   end
	if keyward == '4'
	  @company = Contractor.contractlength_search(params[:search])
	  flash.now[:success] = 'Search Contractors by Contract length'
	   end  
  end

end
