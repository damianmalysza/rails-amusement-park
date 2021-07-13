class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets > self.attraction.tickets && self.user.height > self.attraction.min_height
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save 
    else
      response = "Sorry."
      response += " You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets <  self.attraction.tickets 
      response += " You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height
      response
    end
  end

end
