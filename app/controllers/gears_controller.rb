class GearsController < ApplicationController
  def new
    @gear = Gear.new
    @tag = @gear.tags.new
  end

  def create
    @gear = Gear.new(gear_params)
    if @gear.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def gear_params
    params.require(:gear).permit(:content, tags_attributes: [:content, :_destroy, :id])
  end
end
