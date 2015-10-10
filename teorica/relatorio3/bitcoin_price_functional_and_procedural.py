#!/usr/bin/env python
import json
import urllib2
import sys

if len(sys.argv) == 2:
	response = json.load(urllib2.urlopen("http://api.coindesk.com/v1/bpi/currentprice.json"))
	print("Price of 1 Bitcoin: $" + response["bpi"][str(sys.argv[1]).upper()]["rate"])
else:
	print("Please, run \"python bitcoin_price.py [usd|gbp|eur]\".")