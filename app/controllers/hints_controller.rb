class HintsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :check_access

  # GET /hints
  # GET /hints.json
  def index
    @hints = Hint.order(:id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hints }
    end
  end

  # GET /hints/1
  # GET /hints/1.json
  def show
    @hint = Hint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hint }
    end
  end

  # GET /hints/new
  # GET /hints/new.json
  def new
    @hint = Hint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hint }
    end
  end

  # GET /hints/1/edit
  def edit
    @hint = Hint.find(params[:id])
  end

  # POST /hints
  # POST /hints.json
  def create
    @hint = Hint.new(params[:hint])

    respond_to do |format|
      if @hint.save
        format.html { redirect_to @hint, notice: 'Hint was successfully created.' }
        format.json { render json: @hint, status: :created, location: @hint }
      else
        format.html { render action: "new" }
        format.json { render json: @hint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hints/1
  # PUT /hints/1.json
  def update
    @hint = Hint.find(params[:id])

    respond_to do |format|
      if @hint.update_attributes(params[:hint])
        format.html { redirect_to @hint, notice: 'Hint was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @hint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hints/1
  # DELETE /hints/1.json
  def destroy
    @hint = Hint.find(params[:id])
    @hint.destroy

    respond_to do |format|
      format.html { redirect_to hints_url }
      format.json { head :ok }
    end
  end
end
