class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  # GET /message
  # GET /message.json

  def index
    @message = Message.all
  end

  # GET /message/1
  # GET /message/1.json
  def show
    @message = Message.find(params[:id])
  end

  # GET /message/new
  def new
    @message = Message.new
  end

  # GET /message/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /message
  # POST /message.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
	    if @message.save
	      format.html { redirect_to '/' } #status 302
	      format.json { render json: @message.to_json }
	    else
	      format.html { render 'new'} ## Specify the format in which you are rendering "new" page
	      format.json { render json: @message.errors } ## You might want to specify a json format as well
	    end
	end

  end

  # PATCH/PUT /message/1
  # PATCH/PUT /message/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url, notice: "El mensaje fue editado" }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message/1
  # DELETE /message/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to message_url, notice: "El mensaje fue borrado" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:name, :number_phone, :text)
    end
end

