class NotesController < ApplicationController

  before_action :authenticate_user!

  def create
    if params[:client_id]
      parent = Client.find(params[:client_id])
    elsif params[:dog_id]
      parent = Dog.find(params[:dog_id])
    end
      
    respond_to do |format|
      if @note = parent.notes.create(note_params)
        format.html { redirect_to parent, notice: 'Note was successfully created.' }
        format.js
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    client = Client.find(params[:client_id])
    @note = client.notes.find(params[:id])
    @note.destroy
    redirect_to client_path(client)
  end
 
  private
    def note_params
      params.require(:note).permit(:annotation)
    end
end
