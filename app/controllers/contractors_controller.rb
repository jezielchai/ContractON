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
        flash[:success] = "Please complete your profile" + ' '  + @contractor.firstName
        redirect_to controller: "contractor_profiles", action: "new", id:current_contractor.id
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
	 @company = Company.all
   end

   def index
         @contractor = Company.name_conditions(params[:name])  
	 @contractor = Company.industry_conditions(params[:industry])
         end

end

