require "rspec"
require "time"
require_relative "./flight.rb"


describe Flight do

  @code = "W6 2210"
  @depTime = Time.parse("26/03/2012 08:15")
  @arrTime = Time.parse("26/03/2012 11:45")
  @depAirport = "London Luton"
  @arrAirport = "Budapest"
  @price = 89.99

  before(:each) do

    @f = Flight.new(@code, @depTime, @depAirport, @arrTime, @arrAirport, @price)
  end

  it "should work" do
    @f.code.should == @code
    @f.departureTime.should == @depTime
    @f.departureAirport.should == @depAirport
    @f.arrivalTime.should == @arrTime
    @f.arrivalAirport.should == @arrAirport
    @f.price.should == @price

  end

  it "should be immutable" do
    @f.code = "Modified"
    @f.code.should == @code
    @f.departureTime = "Modified"
    @f.departureTime.should == @depTime
    @f.departureAirport = "Modified"
    @f.departureAirport.should == @depAirport
    @f.arrivalTime = "Modified"
    @f.arrivalTime.should == @arrTime
    @f.arrivalAirport = "Modified"
    @f.arrivalAirport.should == @arrAirport
    @f.price = "Modified"
    @f.price.should == @price
  end
end