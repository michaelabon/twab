#!/usr/bin/env ruby

require 'sinatra'
require 'simple-rss'
require 'open-uri'
require_relative './twab'

get '/' do
  first_twab = find_twab()

  redirect first_twab
rescue => e
  return e.message
end
