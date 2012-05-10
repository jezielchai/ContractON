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
      @contractors=Contractor.all
	 
  end

  def index
         keyward = params[:keywards]
	 if keyward == '1'
	  @company = Contractor.fname_search(params[:search])
	  flash.now[:success] = 'Search Contractors by First Name'
	 end
	 if keyward == '2'
	  @company = Contractor.lname_search(params[:search])
	  flash.now[:success] = 'Search Contractors by Last Name'
	   end
	 if keyward == '3'
	  @company = Contractor.email_search(params[:search])
	  flash.now[:success] = 'Search Contractors by Email'
	   end
  end

end
