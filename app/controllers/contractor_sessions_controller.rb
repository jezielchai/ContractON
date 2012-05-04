class ContractorSessionsController < ApplicationController
def new
   end

   def create
	 contractor = Contractor.find_by_firstName(params[:session][:firstName])
	 #password = Company.find_by_name(params[:session][:name]).password
	 #company.update_attributes(industy: "TEXT")
	 #Company.create(name: company.name, industry: "test")
	  @current_company = @company
	   if contractor && contractor.password == (params[:session][:password])
		   sign_in contractor
		   redirect_to contractor 
	   else 
                  flash.now[:error] = 'Invalid email/password combination'
		  render 'new'
	   end
		 
    end
   #def show
	#   current_company()
	 #  com = @current_company
  # end
   def destroy
	   sign_out
	   redirect_to root_path
   end

end
