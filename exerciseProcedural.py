import urllib
import json

url = "https://currency-api.appspot.com/api/USD/EUR.json"

url = urllib.urlopen(url)

result = url.read()


result = json.loads(result)

url.close()
print result["rate"]


# import json
# import urllib

# f = raw_input('Enter currency to convert from(Currency Code): ')
# t = raw_input('Enter the currency to convert to(Currency Code): ')

# value = float(raw_input('Enter value to convert: '))
# url = urllib.urlopen(('https://currency-api.appspot.com/api/%s/%s.json') % (f, t)
# res = json.load(url)
# print res

# import request

# code1 = input('Enter currency to convert from?')
# code1 = code1.upper()

# code2 = input('Enter currency to convert to?')
# code2 = code2.upper()

# amount = float(input('Enter value to convert?'))

# url = 'https://www.google.com/finance/converter?a=1&from=%s&to=%s%27' % (code1, code2)

# # Define where the results could be find and convert the split separator in byte.
# # Can't be simplified as a variable can't be called through bytes
# separator1 = '</div>\n \n<div id="currency_converter_result">1 %s = ' % code1 # Google
# separator1 = str.encode(separator1) # Convert it in a byte type

# separator2 = ' %s' % code2 # Google
# separator2 = str.encode(separator2) # Convert it in a byte type

# webpage = request.urlopen(url)

# rate = float(webpage.read().split(separator1)[1].split(separator2)[0].strip())
# print('Rate: 1 %s = %.4f %s' % (code1, rate, code2))

# total = amount * rate

# print('%.2f %s = %.2f %s' % (amount, code1, total, code2))

# webpage.close()