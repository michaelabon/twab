#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rackup'
require 'sinatra'
require 'simple-rss'
require 'open-uri'
require_relative './twab'

get '/' do
  first_twab = find_twab

  if params[:test]
    return "Found #{first_twab}"
  end

  redirect first_twab
rescue StandardError => e
  return e.message
end
