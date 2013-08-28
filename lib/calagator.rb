require 'calagator/version'
require 'httparty'

module Calagator
  include HTTParty
  base_uri 'http://calagator.org'

  def self.events
    get('/events.json')
  end

  def self.event(id)
    get("/events/#{id}.json")
  end

  def self.venues
    get('/venues.json')
  end

  def self.venue(id)
    get("/venues/#{id}.json")
  end
end
