class FlightsController < ApplicationController
  def index
    
    @airports = Airport.all.map{ |a| [ a.code, a.id ] }
    @months = Flight.all.map{ |f| [ f.departure.strftime("%m"), f.departure.strftime("%m") ] }.uniq.sort
    @days = Flight.all.map{ |f| [ f.departure.strftime("%d"), f.departure.strftime("%d") ] }.uniq.sort
    @years = Flight.all.map{ |f| [ f.departure.strftime("%Y"), f.departure.strftime("%Y") ] }.uniq.sort
    @num_passengers = [["1",1], ["2",2], ["3",3], ["4",4]]

    if params[:from_airport]
      date = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i, 0, 0, 0, '-8')
      @flights = Flight.where(departure: date..(date + 1.day)).where(
                              "from_airport_id = ? AND
                               to_airport_id = ?", 
                               params[:from_airport].to_i,
                               params[:to_airport].to_i)
      @selected_num_passengers = params[:num_passengers]

    end
  end

  
end
