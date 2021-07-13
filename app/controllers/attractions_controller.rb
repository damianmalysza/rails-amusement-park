class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end
  
  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
  end
  
  def new
    if logged_in? && is_admin?
      @attraction = Attraction.new
    else
      redirect_to attractions_path
    end
  end
  
  def create 
    attraction = Attraction.create(atr_params)
    redirect_to attraction_path(attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
    redirect_to attractions_path if !@attraction
  end

  def update
    attraction = Attraction.find(params[:id])
    if attraction
      attraction.update(atr_params)
      redirect_to attraction_path(attraction)
    else
      redirect_to attractions_path
    end
  end

  private

  def atr_params
    params.require(:attraction).permit(:name,:min_height,:happiness_rating,:nausea_rating,:tickets)
  end
  
end
