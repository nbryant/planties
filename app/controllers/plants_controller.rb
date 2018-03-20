class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :update, :destroy]

  # GET /plants
  def index
    @plants = Plant.all
    json_response(@plants)
  end

  # POST /plants
  def create
    @plant = Plant.create!(plant_params)
    json_response(@plant, :created)
  end

  # GET /plants/:id
  def show
    json_response(@plant)
  end

  # PUT /plants/:id
  def update
    @plant.update(plant_params)
    head :no_content
  end

  # DELETE /plants/:id
  def destroy
    @plant.destroy
    head :no_content
  end

  private

  def plant_params
    # whitelist params
    params.permit(:scientific_name, :common_name, :light, :type)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end