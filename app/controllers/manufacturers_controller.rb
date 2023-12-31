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
    @discs = @manufacturer.discs.order(:mold_name)

    if params[:speed].present?

      @discs = @discs.where("speed >= ?", params[:speed].to_i)

    end
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
      name: params[:manufacturer][:name],
      is_american: params[:manufacturer][:is_american], 
      num_pros: params[:manufacturer][:num_pros],
    })

    redirect_to "/manufacturers"
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.discs.destroy_all
    @manufacturer.destroy
    
    redirect_to '/manufacturers'
  end
end
