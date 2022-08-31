#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'
require 'simple-rss'
require 'open-uri'
require_relative './twab'

get '/' do
  first_twab = find_twab

  redirect first_twab
rescue StandardError => e
  return e.message
end
