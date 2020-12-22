class GearsController < ApplicationController
  before_action :set_gear, only: [:edit, :update]

  def index
    @gears = Gear.all
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params)
    if @gear.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gear.update(gear_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def gear_params
    params.require(:gear).permit(:content, images: [])
  end

  def set_gear
    @gear = Gear.find(params[:id])
  end
end
