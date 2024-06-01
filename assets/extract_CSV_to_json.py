import csv
import json
all = dict()
with open("assets/worldcities.csv", 'r') as csvFile:
    csvFile = csv.reader(csvFile)
    myList =[]
    for lines in csvFile:
        myList.append(lines)
    
    all['citiys'] = myList

with open("newJsonWorldCities.json", 'w') as j:
    json.dump(all, j, indent= 0, sort_keys=True)