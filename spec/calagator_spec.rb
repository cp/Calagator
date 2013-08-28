require 'spec_helper'
require 'json'

describe Calagator do

  describe '.events' do
    it 'should parse json' do
      stub_request(:get, "http://calagator.org/events.json").
        to_return(:status => 200, :body => IO.read('spec/responses/events.json'))
      expect { JSON.parse(Calagator.events) }.not_to raise_error
    end

    it 'should be an array' do
      stub_request(:get, "http://calagator.org/events.json").
        to_return(:status => 200, :body => IO.read('spec/responses/events.json'))
      events = JSON.parse(Calagator.events)
      events.should be_a Array
    end

    it 'should return a 200' do
      stub_request(:get, "http://calagator.org/events.json").
        to_return(:status => 200)
      code = Calagator.events.code
      code.should == 200
    end
  end

  describe '.event' do
    it 'should return a 200' do
      stub_request(:get, "http://calagator.org/events/1250462882.json").
        to_return(:status => 200)
      Calagator.event('1250462882').code.should == 200
    end
    
    it 'should have a title' do
      stub_request(:get, "http://calagator.org/events/1250462882.json").
        to_return(:status => 200, :body => IO.read('spec/responses/event.json'))
      json = JSON.parse(Calagator.event('1250462882'))
      json.should have_key("title")
    end
  end

  describe '.venues' do
    it 'should return a 200' do
      stub_request(:get, "http://calagator.org/venues.json").
        to_return(:status => 200)
      code = Calagator.venues.code
      code.should == 200
    end

    it 'should all have titles' do
      stub_request(:get, "http://calagator.org/venues.json").
        to_return(:status => 200, :body => IO.read('spec/responses/venues.json'))
      json = JSON.parse(Calagator.venues)
      expect { json.map {|v| v['tiitle'] }}.not_to raise_error
    end
  end

  describe '.venue' do
    it 'should return a 200' do
      stub_request(:get, "http://calagator.org/venues/202392011.json").
        to_return(:status => 200)
      code = Calagator.venue('202392011').code
      code.should == 200
    end

    it 'should match ID' do
      stub_request(:get, "http://calagator.org/venues/202392011.json").
        to_return(:status => 200, :body => IO.read('spec/responses/venue.json'))
      json = JSON.parse(Calagator.venue('202392011'))
      json['id'].should == 202392011
   end
  end
end
