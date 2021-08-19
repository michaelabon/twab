#!/usr/bin/env ruby

require 'sinatra'
require 'simple-rss'
require 'open-uri'

get '/' do
  url = 'https://www.bungie.net/en/Rss/NewsByCategory'

  f = SimpleRSS.parse(URI.open(url))

  first_twab = f.entries.find { |e| e.title.match(/This Week At Bungie/) }

  if !first_twab
    return "No TWAB found"
  end

  redirect first_twab.link
end
