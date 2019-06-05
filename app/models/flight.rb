class Flight < ApplicationRecord
    belongs_to :from_airport, class_name: "Airport"
    belongs_to :to_airport, class_name: "Airport"

    def self.get_flight_dates
        flight_dates = UgradRsvp.find_by_sql("select distinct event_date from admissions.ugrad_rsvps where event_date is not null order by event_date desc")
    end 

    
end
