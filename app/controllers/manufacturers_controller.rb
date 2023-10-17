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
      is_american: params[:is_american], 
      num_pros: params[:num_pros],
    })

    manufacturer.save

    redirect_to '/manufacturers'
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    manufacturer = Manufacturer.find(params[:id])
    manufacturer.update({
      name: params[:manufactuer][:name],
      is_american: params[:manufactuer][:is_american], 
      num_pros: params[:manufactuer][:num_pros],
    })

    redirect_to "/manufacturers"
  end
end
