#!/usr/bin/python3


import json
import requests


API_KEY = '== OPENWEATHERMAP API KEY =='
CITY_ID = '== OPENWEATHERMAP CITY ID =='


# get openweathermap data
req = requests.get(f'http://api.openweathermap.org/data/2.5/weather?appid={ API_KEY }&id={ CITY_ID }&units=metric&cnt=1')
res = req.json()


# get the results that we actually care about
temperature = str(round(res['main']['temp']))
weather     = res['weather'][0]['description'].lower()


print(weather + '  %{F#38a89d}' + temperature + '°%{F-}')

