#!/usr/bin/env ruby
# encoding: utf-8

# May you recognize your weaknesses and share your strengths.
# May you share freely, never taking more than you give.
# May you find love and love everyone you find.

require 'docopt'
require 'fog'
require 'nice-sigint'
require 'pp'

doc = <<DOCOPT
dns-dumper.rb

Usage:
   dns-dumper.rb [options]

Options:
   -h, --help        Show this screen.
   --debug           Print out debug messages.

DOCOPT
begin
   options = Docopt::docopt doc
rescue Docopt::Exit => e
   puts e.message
   exit 1
end
pp options if options['--debug']

dns = Fog::DNS.new({
   :provider => 'DNSMadeEasy',
   :dnsmadeeasy_api_key => ENV['DNS_MADE_EASY_KEY'],
   :dnsmadeeasy_secret_key => ENV['DNS_MADE_EASY_SECRET_KEY'],
})
zones = dns.zones.all
zones.each do |zone|
   pp zone
   records = zone.records.all
   records.each do |record|
      pp record
   end
end

