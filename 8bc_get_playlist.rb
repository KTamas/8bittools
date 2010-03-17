#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

abort("Please enter an username as the parameter") unless ARGV[0]
open("http://8bitcollective.com/playlist/#{ARGV[0]}.m3u").each do |line|
  system("wget '#{line.strip}'") unless line.include?('#EXTINF')
end
