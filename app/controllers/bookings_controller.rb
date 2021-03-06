class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_passengers = params[:booking][:num_passengers].to_i
    @booking = Booking.new
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create!(flight_id: params[:booking][:flight_id])
    @flight = Flight.find(params[:booking][:flight_id])
    params[:booking][:passengers_attributes].each do |k, passenger_data|
      @passenger = Passenger.create!(booking_id: @booking.id, 
        name: passenger_data[:name], email: passenger_data[:email])
      PassengerMailer.confirmation_email(@passenger, @flight).deliver_later
    end
    redirect_to "/bookings/#{@booking.id}"
  end

  def show
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers.all
  end
   
  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end
end
