Airport.create!(code: "SFO")
Airport.create!(code: "PDX")
Airport.create!(code: "SEA")

srand 12345
permutations = [1,2,3].permutation(2).to_a
permutations.each do |pair|
    duration = (pair[0] - pair [1]).abs * 3600 * 1.2
    30.times do
        departure = DateTime.new(2019, 6, 1 + rand(29), 1 + rand(23), 
                                 1 + rand(59), 0 , '-8')
        Flight.create!(from_airport_id: pair[0],
                    to_airport_id: pair[1],
                    departure: departure,
                    duration: duration)
    end
end