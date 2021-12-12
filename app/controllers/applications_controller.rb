class ApplicationsController < ApplicationController
  def index

  end

  def new

  end

  def create
    application = Application.create!(app_params)

    redirect_to "/applications/#{application.id}"
  end

  def show
    @application = Application.find(params[:id])
  end

  private
  def app_params
    params.permit(:id, :applicant_name, :address, :city, :state, :zip_code, :reason, :status)
  end
end
