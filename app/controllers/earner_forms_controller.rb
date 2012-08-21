class EarnerFormsController < ApplicationController
	
	before_filter :authenticate_user!
	before_filter :check_access, :except => [:new, :create]

	# GET /earner_forms
  # GET /earner_forms.json
  def index
    @earner_forms = EarnerForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @earner_forms }
    end
  end

  # GET /earner_forms/1
  # GET /earner_forms/1.json
  def show
    @earner_form = EarnerForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @earner_form }
    end
  end

  # GET /earner_forms/new
  # GET /earner_forms/new.json
  def new
		if current_user.earner_forms.count > 0
			render :contact_soon	
		else
    	@earner_form = EarnerForm.new
		end
  end

  # GET /earner_forms/1/edit
  def edit
    @earner_form = EarnerForm.find(params[:id])
  end

  # POST /earner_forms
  # POST /earner_forms.json
  def create
    @earner_form = EarnerForm.new(params[:earner_form])

    respond_to do |format|
      if @earner_form.save
        #render :contact_soon
        format.json { render json: @earner_form, status: :created, location: @earner_form }
				#return
      else
        format.html { render action: "new" }
        format.json { render json: @earner_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /earner_forms/1
  # PUT /earner_forms/1.json
  def update
    @earner_form = EarnerForm.find(params[:id])

    respond_to do |format|
      if @earner_form.update_attributes(params[:earner_form])
        format.html { redirect_to @earner_form, notice: 'Earner form was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @earner_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /earner_forms/1
  # DELETE /earner_forms/1.json
  def destroy
    @earner_form = EarnerForm.find(params[:id])
    @earner_form.destroy

    respond_to do |format|
      format.html { redirect_to earner_forms_url }
      format.json { head :ok }
    end
  end

end
