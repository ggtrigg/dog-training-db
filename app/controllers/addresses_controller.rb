class AddressesController < ApplicationController

  before_action :authenticate_user!

  def create
    @client = Client.find(params[:client_id])
    @client.address = @client.create_address(address_params)
    @client.save
    redirect_to client_path(@client)
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @client.address.destroy
    redirect_to client_path(@client)
  end
 
  private
    def address_params
      params.require(:address).permit(:street1, :street2, :suburb, :postcode, :state, :country)
    end
end
