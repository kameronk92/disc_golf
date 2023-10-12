class DiscsController < ApplicationController
  def index
   @discs = Disc.all
  end

  def show
    
  end
end