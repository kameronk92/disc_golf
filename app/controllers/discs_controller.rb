class DiscsController < ApplicationController
  def index
    @discs = Disc.all
  end

  def show
    @disc = Disc.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.find(params[:id])
    @disc = Disc.new({
      manufacturer_id: @manufacturer.id,
      mold_name: params[:mold_name],
      overstable: params[:overstable],
      speed: params[:speed]
    })

    @disc.save

    redirect_to "/manufacturers/#{@manufacturer.id}/discs"
  end
end
