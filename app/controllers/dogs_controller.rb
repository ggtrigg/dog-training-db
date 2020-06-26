class DogsController < ApplicationController
  
  before_action :authenticate_user!

  def show
    @dog = Dog.find(params[:id])
  end
  
  def edit
    @dog = Dog.find(params[:id])
  end
  
  def create
    @client = Client.find(params[:client_id])
    
    respond_to do |format|
      if @dog = @client.dogs.create(dog_params)
        format.html { redirect_to parent, notice: 'Dog successfully created.' }
        format.js
        format.json { render json: @dog, status: :created, location: @dog }
      else
        format.html { render action: "new" }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
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
