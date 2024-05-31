import requests

response = requests.get("https://www.google.com")
res = response.text[:1000]
print(res)
