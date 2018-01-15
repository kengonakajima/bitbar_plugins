#!/usr/bin/ruby

require "json"
require "pp"

# mackerel cpu/mem/disk
apikey=File.open("/Users/ringo/doc/keys/mackerel.factorio.api.key").read.strip
hostid="3chCRGrPtsG"
json = `curl  --silent -H 'Content-Type: application/json' -H 'X-Api-Key: #{apikey}' https://mackerel.io/api/v0/hosts/#{hostid}`
h = JSON.parse(json)

# CCU
json=`curl --silent http://256t.test-tube.net/stats`
stath=JSON.parse(json)
ccu=stath["ccu"]
print h["host"]["meta"]["filesystem"]["/dev/root"]["percent_used"] + "(#{ccu})"



