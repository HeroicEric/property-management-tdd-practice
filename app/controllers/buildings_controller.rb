class BuildingsController < ApplicationController

  def new
    @building = Building.new
  end

  def create
    @owner = Owner.find(params[:owner_id])
    @building = Building.new(building_params)
    if @building.relationship == true
      @building.owner = @owner
    end


    if @building.save
      redirect_to owner_path(@owner), notice: 'Building Information Added to Listing'
    else
      redirect_to owner_path(@owner), notice: 'Invalid Information'
    end

  end


  private

  def building_params
    params.require(:building).permit(:relationship, :street_address, :state, :city, :postal_code, :description)
  end

end
