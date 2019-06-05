class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map{ |a| [ a.code, a.id ] }
    @dates = Flight.all.map{ |f| [ f.departure.strftime("%m/%d/%Y"), f.departure.strftime("%m/%d/%Y") ] }.uniq.sort
    @passenger_counts = [["1",1], ["2",2], ["3",3], ["4",4],]
  end

  
end
