class OwnersController < ApplicationController

  def new
    @owner = Owner.new
    @buildings = Building.all
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to @owner, notice: "Owner Information Created"
    else
      render :new
    end

  end

  def show
    @owner = Owner.find(params[:id])
    @building = Building.new
    @buildings = @owner.buildings(&:to_hash)
  end

  def destroy
    @owner = Owner.find(params[:id])
    @buildings = @owner.buildings
    @buildings.delete_all
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
