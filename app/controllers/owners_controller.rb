class OwnersController < ApplicationController

  def new
    @owner = Owner.new
    @buildings = Building.all
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to new_owner_path, notice: "Owner Information Created"
    else
      render :new
    end
  end

  def show
    @owner = Owner.find(params[:id])
    @building = Building.new
  end

  def destroy
    @owner = Owner.find(params[:id])
    @buildings = @owner.buildings
    @buildings.each do |b|
      b.update(owner: nil)
    end
    @owner.destroy
    if @owner.destroy
      redirect_to new_owner_path, notice: 'Owner Information Deleted'
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :company_name, :email)
  end

end
