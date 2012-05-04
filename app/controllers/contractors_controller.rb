class ContractorsController < ApplicationController
#  before_filter :correct_contractor, only: [:edit, :update]
  
def signup
 @contractor = Contractor.new
 @title = "Sign up"
end

  def show
    @contractor = Contractor.find(params[:id])
  end

  def relationship
  end

   def create
    @contractor = Contractor.new(params[:contractor])
      if @contractor.save
        sign_in @contractor
        flash[:success] = "Welcome to ContractON!"
        redirect_to controller: "contractor_profiles", action: "new"
      else
        render 'signup'
   end
 end
   
   def edit
    @contractor = Contractor.find(params[:id])
   end
  
   def update
    @contractor = Contractor.find(params[:id])
    if @contractor.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @contractor
      redirect_to @contractor
    else
      render 'edit'
    end
  end

   def search
	   keyward = params[:keywards]
       
	 if keyward == '1'
	  @company = Company.name_search(params[:search])
	  flash.now[:error] = 'Search Companies by Name'
	   end
	 if keyward == '2'
	  @company = Company.industry_search(params[:search])
	  flash.now[:error] = 'Search Companies by Industry'
	   end  
	 
	 @company = Company.paginate(page: params[:page]) 
  end

   def index
         keyward = params[:keywards]
       
	 if keyward == '1'
	  @company = Company.name_search(params[:search])
	  flash.now[:error] = 'Search Companies by Name'
	   end
	 if keyward == '2'
	  @company = Company.industry_search(params[:search])
	  flash.now[:error] = 'Search Companies by Industry'
	   end  

   end

end

