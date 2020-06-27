class ClientsController < ApplicationController
  
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @clients = Client.all.order updated_at: 'DESC'
  end
  
  def show
  end
  
  def new
    @client = Client.new
    @client.build_address
  end
  
  def edit
    @client.build_address unless @client.address
  end
  
  def create
    @client = Client.new(client_params)
 
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end
  
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.js
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @client.destroy
   
    redirect_to clients_path
  end
  
  private
  def client_params
    params.require(:client).permit(:firstname, :surname, :phone_number, :email_address, :documents,
      address_attributes: [:id, :street1, :street2, :suburb, :postcode, :state, :country],
      dogs_attributes: [:id, :name, :breed, :age, :sex, :desexed],
      notes_attributes: [:id, :annotation],
      attendees_attributes: [:price, :status],
      events_attributes: [:id, :event_type, :location, :price, :date, :duration])
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
