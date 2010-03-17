#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# heheh, this actually could be done in one line. Chaining and blocks ftw. But we choose readability.
doc = Nokogiri(open('http://8bitcollective.com'))
sites = doc.xpath('//ol[@class="most-liked"]/li/a').to_a.collect {|i| i.attribute('href').to_s if i.attribute('href').to_s.include?('music')}.compact!
sites.each do |site|
  sdoc = Nokogiri(open("http://8bitcollective.com#{site}"))
  sdoc.css('a').each do |i| 
    system("wget 'http://8bitcollective.com#{i.attribute('href').to_s}'") if i.attribute('href').to_s.include?('mp3')
  end
end
