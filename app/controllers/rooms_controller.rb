class RoomsController < ApplicationController

	before_filter :authenticate_user!
	authorize_resource :except => [:cancel, :add_record_data, :available, :verify]

	# GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.where("status != 'CANCELLED'").order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :ok }
    end
  end

	def cancel
		@rooms = Room.cancel(params[:user_id])
		respond_to do |format|
      format.json { render json: @rooms }
    end
	end

	def add_record_data
		@room = Room.find(params[:id])
		@room.record_id = params[:record_id]
		@room.save
		respond_to do |format|
			format.json { render json: @room }
		end
	end

	def available
		@rooms = Room.available(session[:language])
		respond_to do |format|
			format.json { render json: @rooms }
		end
	end
	
	def keepalive 
		@room = Room.find(params[:id])
		@room.update_attribute(:updated_at, Time.now)
		respond_to do |format|
			format.json { render json: @rooms }
		end
	end

	def reactivate
		@room = Room.find(params[:id])
		if @room.joiner_id
			@room.update_attribute(:status, "ENGAGED")
		else
			@room.update_attribute(:status, "JOINED")
		end

		respond_to do |format|
			format.json { render json: @rooms }
		end
	end

	def verify
		room_id = Room.verify(params[:id], current_user.id)

		respond_to do |format|
			format.json { render json: {:room_id => room_id} }
	  end	
	end

end
