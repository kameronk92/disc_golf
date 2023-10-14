class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(created_at: :asc)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def show_discs
    @manufacturer = Manufacturer.find(params[:id])
  end
end