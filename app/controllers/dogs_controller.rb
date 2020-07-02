class DogsController < ApplicationController
  
  before_action :set_dog, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def show
  end
  
  def edit
  end
  
  def create
    @client = Client.find(params[:client_id])
    
    respond_to do |format|
      if @dog = @client.dogs.create(dog_params)
        
        format.html { redirect_to parent, notice: 'Dog successfully created.' }
        format.js { flash.now[:notice] = 'Dog successfully created.' }
        format.json { render json: @dog, status: :created, location: @dog }
      else
        format.html { render action: "new", alert: 'Unable to create dog, please try again.' }
        format.js { flash.now[:alert] = 'Unable to create dog, please try again.' }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
        format.js { flash.now[:notice] = 'Dog successfully updated.' }
        format.json { render json: @dog, status: :created, location: @dog }
      else
        format.html { render action: "edit", alert: 'Unable to update dog, please try again.' }
        format.js { flash.now[:alert] = 'Unable to update dog, please try again.' }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
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
      params['dog']['services'].delete_if(&:empty?) if params['dog']['services'].present?
      params.require(:dog).permit(:name, :breed, :age, :sex, :desexed, :documents, services: [])
    end

    def set_dog
      @dog = Dog.find(params[:id])
    end
  end
