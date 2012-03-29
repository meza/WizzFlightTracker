require "rspec"
require "time"
require_relative "./parser.rb"
require_relative "./flight.rb"

describe Parser do

  before(:each) do
    @parser = Parser.new
  end

  it "should find the main content" do

    testId = "test"
    input = "<html><body><div><div id='"+testId+"'>xxx</div></div></body></html>"
    @parser.contentOf(input, testId).should == "xxx"
  end

  it "should parse flight information" do
    input = '<li class="flights_date">
	<div>
		<input type="radio" value="20120326" name="departDate1">26/03/2012<input type="submit">
	</div>
	<div class="flights_daylist">
		<div class="flights_flight">
			Flight <span class="flights_flightnumber">W6 2202</span>, departure: <span class="flights_departuretime">08:15</span>
			<span class="flights_departureairport">London Luton</span>,
			<span class="flights_departurecountry">UK</span>, arrival:
			<span class="flights_arrivaltime">11:45</span>
			<span class="flights_arrivalairport">Budapest</span>,
			<span class="flights_arrivalcountry">Hungary</span>.
			Tickets from <span class="flights_price"></span>.
		</div>
		<div class="flights_flight">
			Flight <span class="flights_flightnumber">W6 2206</span>, departure: <span class="flights_departuretime">14:25</span>
			<span class="flights_departureairport">London Luton</span>, <span class="flights_departurecountry">UK</span>,
			arrival: <span class="flights_arrivaltime">17:50</span>
			<span class="flights_arrivalairport">Budapest</span>, <span class="flights_arrivalcountry">Hungary</span>.
			Tickets from <span class="flights_price">GBP 89.99</span>.
		</div>
	</div>
</li>
<li class="flights_date">
	<div>
		<input type="radio" value="20120327" name="departDate1">27/03/2012<input type="submit">
	</div>
	<div class="flights_daylist">
		<div class="flights_flight">
			Flight <span class="flights_flightnumber">W6 2210</span>, departure: <span class="flights_departuretime">20:30</span>
			<span class="flights_departureairport">London Luton</span>, <span class="flights_departurecountry">UK</span>,
			arrival: <span class="flights_arrivaltime">23:55</span>
			<span class="flights_arrivalairport">Budapest</span>, <span class="flights_arrivalcountry">Hungary</span>.
			Tickets from <span class="flights_price">GBP 72.99</span>.
		</div>
	</div>
</li>'

    expected = [
        Flight.new("W6 2202", Time.parse("26/03/2012 08:15"), "London Luton", Time.parse("26/03/2012 11:45"),
                   "Budapest"),
        Flight.new("W6 2206", Time.parse("26/03/2012 14:25"), "London Luton", Time.parse("26/03/2012 17:50"),
                   "Budapest", 89.99),
        Flight.new("W6 2210", Time.parse("27/03/2012 20:30"), "London Luton", Time.parse("27/03/2012 23:55"),
                   "Budapest", 72.99),
    ]

    @parser.extractFlightsFrom(input).should == expected

  end

end