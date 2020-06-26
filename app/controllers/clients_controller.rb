class ClientsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @clients = Client.all.order updated_at: 'DESC'
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
    @client.build_address
  end
  
  def edit
    @client = Client.find(params[:id])
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
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end
  
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
   
    redirect_to clients_path
  end
  
  private
  def client_params
    params.require(:client).permit(:firstname, :surname, :phone_number, :email_address,
      address_attributes: [:id, :street1, :street2, :suburb, :postcode, :state, :country],
      dogs_attributes: [:id, :name, :breed, :age, :sex, :desexed],
      notes_attributes: [:id, :annotation],
      attendees_attributes: [:price, :status],
      events_attributes: [:id, :event_type, :location, :price, :date, :duration])
  end
end
