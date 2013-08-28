Calagator  [![Build Status](https://travis-ci.org/ColbyAley/Calagator.png?branch=master)](https://travis-ci.org/ColbyAley/Calagator)
===

A wrapper for [Calagator's](http://calagator.org) undocumented API. Using HTTParty for requests, Mechanize for posting to forms (TODO), and RSpec and Webmock for testing.

## Installation

Add this line to your application's Gemfile:

    gem 'calagator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install calagator

## Usage

The gem allows for retrieving infomation about venues and events, as well as creating events.

#### Events

    Calagator.events
    Calagator.event(id)

#### Venues

    Calagator.venues
    Calagator.venue(id)

## Todo

* Use Mechanize to create events.
* Sorting of events and venues.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write tests and run `rspec`. Ensure both your new tests and existing tests pass
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
