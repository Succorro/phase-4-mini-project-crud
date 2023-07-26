class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    render json: Spice.all
  end

  # def show
  #   render json: find_spice
  # end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created 
  end

  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice, status: :accepted 
  end

  def destroy
    spice = find_spice
    spice.destroy 
    render json: {}
  end

  private 

  def find_spice
    Spice.find(params[:id])
  end 

  def spice_params 
    params.permit(:title, :image, :description, :notes, :rating)
  end 

  def render_not_found
    render json: {error: "Spice not found"}, status: :not_found
  end 
end
