class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def create
    @owner = Owner.find(params[:owner_id])
    @building = @owner.buildings.build(building_params)

    if @building.save
      redirect_to owner_path(@owner), notice: 'Building Information Added to Listing'
    else
      flash.now[:alert] = 'Invalid Information'
      render 'owners/show'
    end

  end

  private

  def building_params
    params.require(:building).permit(:relationship, :street_address, :state, :city, :postal_code, :description)
  end

end
