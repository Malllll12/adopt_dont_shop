class ApplicationsController < ApplicationController
  def index

  end

  def new

  end

  def create
    application = Application.new(app_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:alert] = "Error: Fields can not be left blank"
      redirect_to '/applications/new'
    end
  end

  def show
    @application = Application.find(params[:id])
    if params[:search].present?
      @pets = Pet.search(params[:search])
    else
      @pets = @application.pets
    end
  end

  private
  def app_params
    params.permit(:id, :applicant_name, :address, :city, :state, :zip_code, :reason, :status)
  end
end
