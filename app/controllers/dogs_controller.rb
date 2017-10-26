class DogsController < ApplicationController
  http_basic_authenticate_with name: "ggt", password: "prussik", only: :destroy
  
  def create
    @client = Client.find(params[:client_id])
    @dog = @client.dogs.create(dog_params)
    redirect_to client_path(@client)
  end
  
  def destroy
    @client = Client.find(params[:client_id])
    @dog = @client.dogs.find(params[:id])
    @dog.destroy
    redirect_to client_path(@client)
  end
 
  private
    def dog_params
      params.require(:dog).permit(:name, :breed, :age, :sex, :desexed)
    end
end
