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
        redirect_to root_path
      else
        render 'signup'
   end
 end
end

