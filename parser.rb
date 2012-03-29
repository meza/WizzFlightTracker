require 'nokogiri'
require 'time'
require_relative './flight.rb'

class Parser
  def contentOf(string, id)
    base = Nokogiri::HTML(string)
    return base.xpath("//*[@id='"+id+"']").text
  end

  def extractFlightsFrom(string)
    result = []
    base = Nokogiri::HTML(string)
    flights = base.xpath("//li[@class='flights_date']")
    flights.each do |flight|
      date = flight.xpath(".//*[@name='departDate1']/@value").to_s
      routes = flight.xpath(".//div[@class='flights_flight']")
      routes.each do |route|
        result.push(parseRoute(date, route))
      end
    end
    return result
  end

  def parseRoute(date, route)
    code = route.xpath(".//span[@class='flights_flightnumber']").text
    depTime = route.xpath(".//span[@class='flights_departuretime']").text
    depAirp = route.xpath(".//span[@class='flights_departureairport']").text
    arrTime = route.xpath(".//span[@class='flights_arrivaltime']").text
    arrAirp = route.xpath(".//span[@class='flights_arrivalairport']").text
    price = route.xpath(".//span[@class='flights_price']").text
    if (false == price.empty?)
      m = price.match /GBP\s?([0-9\.]*)/
      price = m[1].to_f
    else
      price = nil
    end

    return Flight.new(code, Time.parse(date+" "+depTime), depAirp, Time.parse(date+" "+arrTime), arrAirp,
                           price)
  end
end