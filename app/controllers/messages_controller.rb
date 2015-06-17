class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_form, only: [:new, :edit]
  
  # GET /messages
  # GET /messages.json
  def index
    
    # puts "                  begin               "
    # puts User.findUser(params[:user_email]).inspect #Message.where(reciever: params[:user_id])
    # puts "                  end               "
    
    @messages = Message.where(reciever: User.findUser(params[:user_email]).id)
  end
  
  # GET /messages/new
  def new
    @message = Message.new
  end
  
  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully sent.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # GET /messages/1
  # GET /messages/1.json
  def show
    puts "                  begin               "
    # puts User.findUser("how_man@mail").inspect #User.getEmail User.find_user_by_id @message.reciever
    # puts User.getEmail User.find_user_by_id(@message.reciever)#.inspect 
    #User.findUser(params[:email]) #user_messages_path(@message.reciever)
    puts "                  end               "
  end
  
  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(user_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end
  
  # Callback to set up all the form objects
  def set_form
    # find the maximum number of users possible
    @max_count = User.all.count
    # check if a message already exists
    if !(defined?(@message)).nil?
      @sender = @message.sender
      @reciever = @message.reciever
    else # else the message is then being created
      # set the sender as the user creating the message
      @sender = params[:user_id]
      # let user determine the reciever of his message
      @reciever = nil
    end
    
  end
    
  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params[:message].permit(:sender,:reciever,:content)
  end
  
end
