class IntakeFormsController < ApplicationController
  before_action :authenticate_user!

  def update
    @dog = Dog.find(params[:dog_id])
    if @dog.intake_form.update(intake_form_params)
      notice = 'Details saved.'
    else
      alert = 'Error saving details!'
    end
    redirect_to dog_path(@dog)
  end

  private
    def intake_form_params
      params.require(:intake_form).permit(intake_details_attributes: [:text, :id])
    end
end