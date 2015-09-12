import requests
import json
import urllib

f = raw_input('Enter currency to convert from(Currency Code): ')
t = raw_input('Enter the currency to convert to(Currency Code): ')

value = float(raw_input('Enter value to convert: '))
url = urllib.urlopen(('https://www.exchangerate-api.com/%s/%s/%F?k=API_KEY') % (f, t, value))
res = url.read()
print res
