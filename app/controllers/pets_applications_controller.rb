class PetsApplicationsController < ApplicationController
  def create
    @pets_applications = PetsApplication.create(pet_app_params)

    redirect_to "/applications/#{@pets_applications.application_id}"
  end

  private
  def pet_app_params
    params.permit(:application_id, :pet_id)
  end
end
