class EvaluationSellersController < ApplicationController

	before_filter :authenticate_user!
	#TODO: check_access needed

	# GET /evaluation_sellers
  # GET /evaluation_sellers.json
  def index
    @evaluation_sellers = EvaluationSeller.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluation_sellers }
    end
  end

  # GET /evaluation_sellers/1
  # GET /evaluation_sellers/1.json
  def show
    @evaluation_seller = EvaluationSeller.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluation_seller }
    end
  end

  # GET /evaluation_sellers/new
  # GET /evaluation_sellers/new.json
  def new
    @evaluation_seller = EvaluationSeller.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluation_seller }
    end
  end

  # GET /evaluation_sellers/1/edit
  def edit
    @evaluation_seller = EvaluationSeller.find(params[:id])
  end

  # POST /evaluation_sellers
  # POST /evaluation_sellers.json
  def create
    @evaluation_seller = EvaluationSeller.new(params[:evaluation_seller])

    respond_to do |format|
      if @evaluation_seller.save
        format.html { redirect_to "/"}
        format.json { render json: @evaluation_seller, status: :created, location: @evaluation_seller }
      else
        format.html { render action: "new" }
        format.json { render json: @evaluation_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evaluation_sellers/1
  # PUT /evaluation_sellers/1.json
  def update
    @evaluation_seller = EvaluationSeller.find(params[:id])

    respond_to do |format|
      if @evaluation_seller.update_attributes(params[:evaluation_seller])
        format.html { redirect_to @evaluation_seller, notice: 'Evaluation seller was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluation_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_sellers/1
  # DELETE /evaluation_sellers/1.json
  def destroy
    @evaluation_seller = EvaluationSeller.find(params[:id])
    @evaluation_seller.destroy

    respond_to do |format|
      format.html { redirect_to evaluation_sellers_url }
      format.json { head :ok }
    end
  end
end
