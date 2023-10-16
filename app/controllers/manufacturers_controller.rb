class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(created_at: :desc)
  end

  def new

  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def show_discs
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    manufacturer = Manufacturer.new({
      name: params[:name],
    })

    manufacturer.save

    redirect_to '/manufacturers'
  end
end
