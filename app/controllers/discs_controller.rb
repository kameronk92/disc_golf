class DiscsController < ApplicationController
  def index
    @discs = Disc.where(overstable: true)
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

  def edit
    @disc = Disc.find(params[:id])
  end

  def update
    disc = Disc.find(params[:id])
    disc.update({
      mold_name: params[:disc][:mold_name],
      overstable: params[:disc][:overstable],
      speed: params[:disc][:speed]
    })

    redirect_to "/discs/#{disc.id}"
  end

  def destroy
    Disc.destroy(params[:id])

    redirect_to "/discs"
  end
end
