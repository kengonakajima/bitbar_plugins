#!/usr/bin/ruby

require "json"
require "pp"

#print "TT :shit:\n"

json=`curl -s http://150.95.140.179:8123/up/world/world/1496438497135`

hash=JSON.parse(json)

svt = hash["servertime"].to_i
sec = (svt * 3.6).to_i
totalmin = (sec/60).to_i
min = totalmin%60
hour = (totalmin/60).to_i

num = hash["currentcount"].to_i

printf( "%02d:%02d(%d)", hour,min,num)





