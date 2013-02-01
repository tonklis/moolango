class FeedbackFormsController < ApplicationController
  
	before_filter :authenticate_user!
  authorize_resource :except => [:new, :create]
  
  # GET /feedback_forms
  # GET /feedback_forms.json
  def index
    @feedback_forms = FeedbackForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedback_forms }
    end
  end

  # GET /feedback_forms/1
  # GET /feedback_forms/1.json
  def show
    @feedback_form = FeedbackForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback_form }
    end
  end

  # GET /feedback_forms/new
  # GET /feedback_forms/new.json
  def new
    @feedback_form = FeedbackForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback_form }
    end
  end

  # GET /feedback_forms/1/edit
  def edit
    @feedback_form = FeedbackForm.find(params[:id])
  end

  # POST /feedback_forms
  # POST /feedback_forms.json
  def create
    @feedback_form = FeedbackForm.new(params[:feedback_form])

    respond_to do |format|
      if @feedback_form.save
        format.html { redirect_to "/"}
        format.json { render json: @feedback_form, status: :created, location: @feedback_form }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedback_forms/1
  # PUT /feedback_forms/1.json
  def update
    @feedback_form = FeedbackForm.find(params[:id])

    respond_to do |format|
      if @feedback_form.update_attributes(params[:feedback_form])
        format.html { redirect_to @feedback_form, notice: 'Feedback form was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_forms/1
  # DELETE /feedback_forms/1.json
  def destroy
    @feedback_form = FeedbackForm.find(params[:id])
    @feedback_form.destroy

    respond_to do |format|
      format.html { redirect_to feedback_forms_url }
      format.json { head :ok }
    end
  end
end
