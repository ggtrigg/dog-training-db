class DogsController < ApplicationController
  # http_basic_authenticate_with name: "ggt", password: "prussik", only: :destroy
  
  before_action :authenticate_user!

  
  def edit
    @dog = Dog.find(params[:id])
  end
  
  def create
    @client = Client.find(params[:client_id])
    @dog = @client.dogs.create(dog_params)
    redirect_to client_path(@client)
  end
  
  def update
    @dog = Dog.find(params[:id])
    
    if @dog.update(dog_params)
      redirect_to @dog.client
    else
      render 'edit'
    end
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
