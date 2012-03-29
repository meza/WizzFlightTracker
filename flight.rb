class Flight

  attr_reader(:code, :departureTime, :departureAirport, :arrivalTime, :arrivalAirport, :price)

  def initialize(code, depTime, depAirport, arrTime, arrAirport, xPrice=nil)
    @code = code
    @departureTime = depTime
    @departureAirport = depAirport
    @arrivalTime = arrTime
    @arrivalAirport = arrAirport
    @price = xPrice
  end

  def ==(f)
    if (f.code != code)
      return false
    end

    if (f.departureTime != departureTime)
      return false
    end

    if (f.departureAirport != departureAirport)
      return false
    end

    if (f.arrivalTime != arrivalTime)
      return false
    end

    if (f.arrivalAirport != arrivalAirport)
      return false
    end

    if (f.price != price)
      return false
    end

    return true
  end

  def code=(arg)

  end

  def departureAirport=(arg)

  end

  def departureTime=(arg)

  end

  def arrivalAirport=(arg)

  end

  def arrivalTime=(arg)

  end

  def price=(arg)

  end


end