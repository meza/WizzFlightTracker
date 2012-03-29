class Collector
  def filter(input)
    result = []
    input.each do |flight|
      if (flight.departureTime.thursday? || flight.departureTime.friday?)
        result.push(flight)
      end
    end
    result
  end
end