class PassengerMailer < ApplicationMailer
    default from: 'eep@example.com'

    def confirmation_email(passenger, flight)
        @passenger = passenger
        @flight = flight
        mail(to: @passenger.email, subject: 'you booked a free fake flight')
    end

end
