
#print("123")

import json

json_string = '{"employee": {"name": "jai", "salary": 100000}}'

data = json.loads(json_string)

print(data['employee']['name'])
print(data['employee']['salary'])
