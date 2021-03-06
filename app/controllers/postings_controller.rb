class PostingsController < ApplicationController
  # GET /postings
  # GET /postings.json
  def index
    @postings = Posting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @postings }
    end
  end

  # GET /postings/1
  # GET /postings/1.json
  def show
    @posting = Posting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @posting }
    end
  end

  # GET /postings/new
  # GET /postings/new.json
  def new
    @posting = Posting.new
    
    respond_to do |format|

     

      format.html # new.html.erb
      format.json { render json: @posting }
    end

  end

  # GET /postings/1/edit
  def edit
    @posting = Posting.find(params[:id])
  end
  
  def inquiry
   if !csigned_in? and not params[:from_email].nil?
      redirect_to(root_path)
    end
    if params[:id].nil?
         @posting = Posting.find(params[:id])
    end
    @opinion = Opinion.new
  end

  # POST /postings
  # POST /postings.json
  def create
    @posting = Posting.new(params[:posting])

    @posting.update_attributes(:company_id => current_company.id)

      if @posting.save
        flash[:success] = "Post was successfully created"
        redirect_to current_company
      else
        render 'new'
      end
    end

  # PUT /postings/1
  # PUT /postings/1.json
  def update
    @posting = Posting.find(params[:id])

    respond_to do |format|
      if @posting.update_attributes(params[:posting])
        format.html { redirect_to @posting, notice: 'Posting was successfullytest1 .' }
	
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postings/1
  # DELETE /postings/1.json
  def destroy
    @posting = Posting.find(params[:id])
    @posting.destroy

    respond_to do |format|
      format.html { redirect_to postings_url }
      format.json { head :no_content }
    end
  end
end
