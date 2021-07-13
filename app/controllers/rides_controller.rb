class RidesController < ApplicationController
  def create
    ride = Ride.create(ride_params)
    response = ride.take_ride
    if response.is_a?(String)
      flash[:alert] = response
    else
      flash[:notice] = "Thanks for riding the #{ride.attraction.name}!"
    end
    redirect_to user_path(ride.user)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id,:attraction_id)
  end
end
