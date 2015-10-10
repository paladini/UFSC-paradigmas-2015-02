import json; import urllib2; print("Price of 1 Bitcoin: $" + json.load(urllib2.urlopen("http://api.coindesk.com/v1/bpi/currentprice.json"))["bpi"]["USD"]["rate"])
