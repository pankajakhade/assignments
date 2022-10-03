import requests
import json

url = "https://opcitotech.webhook.office.com/webhookb2/9c4b01e3-3c7f-40e3-ba23-4b424ee4848b@7cad185a-c463-46e3-ae25-fec131d6f066/IncomingWebhook/ad62dca7c9ea4c68b4ef2f1bb1f3899c/9e95fceb-a39a-4e81-990c-f36c4da49f31"
payload = {
    "text": "Test Message"
}
headers = {
    'Content-Type': 'application/json'
}
response = requests.post(url, headers=headers, data=json.dumps(payload))
print(response.text.encode('utf8'))