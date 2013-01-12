class EvaluationBuyersController < ApplicationController
	
	before_filter :authenticate_user!
	#TODO: check_access needed

	# GET /evaluation_buyers
  # GET /evaluation_buyers.json
  def index
    @evaluation_buyers = EvaluationBuyer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluation_buyers }
    end
  end

  # GET /evaluation_buyers/1
  # GET /evaluation_buyers/1.json
  def show
    @evaluation_buyer = EvaluationBuyer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluation_buyer }
    end
  end

  # GET /evaluation_buyers/new
  # GET /evaluation_buyers/new.json
  def new
    @evaluation_buyer = EvaluationBuyer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluation_buyer }
    end
  end

  # GET /evaluation_buyers/1/edit
  def edit
    @evaluation_buyer = EvaluationBuyer.find(params[:id])
  end

  # POST /evaluation_buyers
  # POST /evaluation_buyers.json
  def create
    @evaluation_buyer = EvaluationBuyer.new(params[:evaluation_buyer])

    respond_to do |format|
      if @evaluation_buyer.save
        format.html { redirect_to "/" }
        format.json { render json: @evaluation_buyer, status: :created, location: @evaluation_buyer }
      else
        format.html { render action: "new" }
        format.json { render json: @evaluation_buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evaluation_buyers/1
  # PUT /evaluation_buyers/1.json
  def update
    @evaluation_buyer = EvaluationBuyer.find(params[:id])

    respond_to do |format|
      if @evaluation_buyer.update_attributes(params[:evaluation_buyer])
        format.html { redirect_to @evaluation_buyer, notice: 'Evaluation buyer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluation_buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_buyers/1
  # DELETE /evaluation_buyers/1.json
  def destroy
    @evaluation_buyer = EvaluationBuyer.find(params[:id])
    @evaluation_buyer.destroy

    respond_to do |format|
      format.html { redirect_to evaluation_buyers_url }
      format.json { head :ok }
    end
  end
end
