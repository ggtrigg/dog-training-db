class NotesController < ApplicationController

  before_action :authenticate_user!

  def create
    if params[:client_id]
      parent = Client.find(params[:client_id])
      client = parent
    elsif params[:dog_id]
      parent = Dog.find(params[:dog_id])
      client = parent.client
    end
      
    @note = parent.notes.create(note_params)
    redirect_to client_path(client)
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
