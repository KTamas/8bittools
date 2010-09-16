#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri(open('http://8bc.org'))
sites = doc.xpath('//ol[@class="most-liked"]/li/a').to_a.collect {|i| i.attribute('href').to_s if i.attribute('href').to_s.include?('/music/')}.compact!
sites.each do |site|
  sdoc = Nokogiri(open('http://8bc.org' + site))
  dl_url = sdoc.xpath('//div[@class="button download"]/a').attribute('href')
  system("wget 'http://8bc.org#{dl_url}'")
end
