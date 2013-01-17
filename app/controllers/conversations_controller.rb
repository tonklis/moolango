class ConversationsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :check_access, :except => [:new_conversation_ui, :create_conversation_ui, :calculate_timezone]
  
  def new_conversation_ui
    @conversation = Conversation.new
    @conversation.status_id = Status.find_by_name("open").id
    @conversation_options = Conversation.get_options(current_user, [['30 minutes','30'], ['60 minutes','60']])
    @time_start = 9
    @offset = '-0500' 
    if (current_user.timezone != nil && current_user.timezone != '')
      start = Time.find_zone('EST').parse("2013-01-01 9am").in_time_zone(current_user.timezone)
      @time_start = start.hour
      hours = (start.utc_offset/60/60).to_s
      if (hours.length == 2)
        @offset = hours[0] == '-' ? hours[0] + '0' + hours[1] + '00' : hours + '00'
      elsif (hours.length < 2)
        @offset = '0' + hours + '00'
      else
        @offset = hours + '00'
      end
    end
  end

  def create_conversation_ui
    params[:conversation][:buyer_id] = params[:buyer_id]
    opentok = OpenTok::OpenTokSDK.new ENV['OPENTOK_API_KEY'], ENV['OPENTOK_API_SECRET']
    session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "enabled"}
    open_tok_session = opentok.create_session(request.remote_addr, session_properties)

    @conversation = Conversation.create_new(params[:conversation], open_tok_session)
    #@conversation = Conversation.new(params[:conversation])
    @conversation_options = Conversation.get_options(current_user, [['30 minutes','30'], ['60 minutes','60']])
    @time_start = 9
    @offset = '-0500' 
    if (current_user.timezone != nil && current_user.timezone != '')
      start = Time.find_zone('EST').parse("2013-01-01 9am").in_time_zone(current_user.timezone)
      @time_start = start.hour
      hours = (start.utc_offset/60/60).to_s
      if (hours.length == 2)
        @offset = hours[0] == '-' ? hours[0] + '0' + hours[1] + '00' : hours + '00'
      elsif (hours.length < 2)
        @offset = '0' + hours + '00'
      else
        @offset = hours + '00'
      end
    end

    respond_to do |format|
      if @conversation.save
        current_user.update_timezone params[:user][:time_zone]
        TestMailer.new_booked_conversation(@conversation).deliver
	render :contact_soon
        format.json { render json: @conversation, status: :created, location: @conversation }
	return
      else
      	format.html { render action: "new_conversation_ui" }
      	format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end 

  def calculate_timezone
    tz = params[:timezone]
    start = Time.find_zone('EST').parse("2013-01-01 9am").in_time_zone(tz)
    hours = (start.utc_offset/60/60).to_s
    if (hours.length == 2)
      offset = hours[0] == '-' ? hours[0] + '0' + hours[1] + '00' : hours + '00'
    elsif (hours.length < 2)
      offset = '0' + hours + '00'
    else
      offset = hours + '00'
    end
    respond_to do |format|
      format.json { render json: {:offset => offset, :time_start => start.hour} }
    end
  end

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conversation }
    end
  end

  # GET /conversations/new
  # GET /conversations/new.json
  def new
    @conversation = Conversation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conversation }
    end
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(params[:conversation])

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render json: @conversation, status: :created, location: @conversation }
      else
        format.html { render action: "new" }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /conversations/1
  # PUT /conversations/1.json
  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to conversations_url }
      format.json { head :ok }
    end
  end
end
