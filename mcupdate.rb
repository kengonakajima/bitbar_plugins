#!/usr/bin/ruby

require "json"
require "pp"

#print "TT :shit:\n"

json=`curl -s http://139.162.118.45:8123/up/world/world/1496438497135`

hash=JSON.parse(json)

svt = hash["servertime"].to_i
sec = (svt * 3.6).to_i
totalmin = (sec/60).to_i
min = totalmin%60
hour = (totalmin/60).to_i
hour += 6
hour -= 24 if hour > 24

num = hash["currentcount"].to_i

members=[]
hash["players"].each do |player|
  members.push( player["name"] + " " + player["x"].to_i.to_s + "," + player["y"].to_i.to_s + "," + player["z"].to_i.to_s )
end

# mackerel disk
apikey=File.open("/Users/ringo/doc/keys/mackerel.factorio.api.key").read.strip
hostid="35GqmJnXmQG"
json = `curl --silent -H 'X-Api-Key: #{apikey}' https://mackerel.io/api/v0/hosts/#{hostid}`
h = JSON.parse(json) 
rootdisk_used = h["host"]["meta"]["filesystem"]["/dev/root"]["percent_used"]

hjout=`curl -s http://139.162.118.45:3000/stats`
hjh=JSON.parse(hjout)
hjnum=hjh["clients"]

printf( "hj#{hjnum} %02d:%02d(%d)\n#{rootdisk_used}\n---\n" + members.join("\n"), hour,min,num)


