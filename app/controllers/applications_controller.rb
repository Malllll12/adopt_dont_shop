class ApplicationsController < ApplicationController
  def index

  end

  def new

  end

  def create
    application = Application.new(app_params)
    application.status = "In Progress"
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
      @pets = Pet.all
    end
  end

  def update
    application = Application.find(params[:id])
    application.status = "Pending"
    application.update(app_params)
    redirect_to "/applications/#{application.id}"
  end

  private
  def app_params
    params.permit(:id, :applicant_name, :address, :city, :state, :zip_code, :reason, :status)
  end
end
