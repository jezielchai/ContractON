class ContractorProfilesController < ApplicationController
  # GET /contractor_profiles
  # GET /contractor_profiles.json
  def index
    @contractor_profiles = ContractorProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contractor_profiles }
    end
  end

  # GET /contractor_profiles/1
  # GET /contractor_profiles/1.json
  def show
    @contractor_profile = ContractorProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contractor_profile }
    end
  end

  # GET /contractor_profiles/new
  # GET /contractor_profiles/new.json
  def new
    @contractor_profile = ContractorProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contractor_profile }
    end
  end

  # GET /contractor_profiles/1/edit
  def edit
    @contractor_profile = ContractorProfile.find(params[:id])
  end

  # POST /contractor_profiles
  # POST /contractor_profiles.json
  def create
    @contractor_profile = ContractorProfile.new(params[:contractor_profile])

    respond_to do |format|
      if @contractor_profile.save
        format.html { redirect_to @contractor_profile, notice: 'Contractor profile was successfully created.' }
        format.json { render json: @contractor_profile, status: :created, location: @contractor_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @contractor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contractor_profiles/1
  # PUT /contractor_profiles/1.json
  def update
    @contractor_profile = ContractorProfile.find(params[:id])

    respond_to do |format|
      if @contractor_profile.update_attributes(params[:contractor_profile])
        format.html { redirect_to @contractor_profile, notice: 'Contractor profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contractor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contractor_profiles/1
  # DELETE /contractor_profiles/1.json
  def destroy
    @contractor_profile = ContractorProfile.find(params[:id])
    @contractor_profile.destroy

    respond_to do |format|
      format.html { redirect_to contractor_profiles_url }
      format.json { head :no_content }
    end
  end
end
