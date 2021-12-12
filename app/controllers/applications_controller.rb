class ApplicationsController < ApplicationController
  def index

  end

  def new

  end

  def show
    @application = Application.find(params[:id])
  end
end
