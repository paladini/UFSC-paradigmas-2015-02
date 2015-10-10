#!/usr/bin/env python
import json
import urllib2
import sys

if len(sys.argv) == 2:
	currency = str(sys.argv[1])
	currency = currency.upper()
	response = urllib2.urlopen("http://api.coindesk.com/v1/bpi/currentprice.json")
	response_parsed = json.load(response)
	print("Price of 1 Bitcoin: $" + response_parsed["bpi"][currency]["rate"])
else:
	print("Please, run \"python bitcoin_price.py [usd|gbp|eur]\".")