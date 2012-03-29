require "rspec"
require "./collector.rb"
require "./flight.rb"

describe "My behaviour" do

  it "filter all flights going on thursday and friday" do

    input = [
        Flight.new("W6 2202", Time.parse("28/03/2012 08:15"), "London Luton", Time.parse("28/03/2012 11:45"),
                   "Budapest"),
        Flight.new("W6 2206", Time.parse("30/03/2012 14:25"), "London Luton", Time.parse("30/03/2012 17:50"),
                   "Budapest", 89.99),
        Flight.new("W6 2206", Time.parse("31/03/2012 14:25"), "London Luton", Time.parse("31/03/2012 17:50"),
                   "Budapest", 89.99),
        Flight.new("W6 2210", Time.parse("29/03/2012 20:30"), "London Luton", Time.parse("29/03/2012 23:55"),
                   "Budapest", 72.99),
        Flight.new("W6 2210", Time.parse("01/04/2012 20:30"), "London Luton", Time.parse("01/04/2012 23:55"),
                   "Budapest", 72.99),
    ]

    expected = [
        Flight.new("W6 2206", Time.parse("30/03/2012 14:25"), "London Luton", Time.parse("30/03/2012 17:50"),
                   "Budapest", 89.99),
        Flight.new("W6 2210", Time.parse("29/03/2012 20:30"), "London Luton", Time.parse("29/03/2012 23:55"),
                   "Budapest", 72.99),
    ]
    collector = Collector.new
    collector.filter(input).should == expected


  end
end