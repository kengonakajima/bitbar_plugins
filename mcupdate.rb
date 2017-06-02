#!/usr/bin/ruby

require "json"
require "pp"

#print "TT :shit:\n"

json=`curl -s http://150.95.140.179:8123/up/world/world/1496438497135`

hash=JSON.parse(json)

svt = hash["servertime"].to_i
sec = (svt * 3.6).to_i
min = (sec/60).to_i
hour = (min/60).to_i

num = hash["currentcount"].to_i

print "#{hour}:#{min%60}(#{num})"




