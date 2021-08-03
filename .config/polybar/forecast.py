#!/usr/bin/python3


import json
import requests


API_KEY = '== OPENWEATHERMAP API KEY =='
CITY_ID = '== OPENWEATHERMAP CITY ID =='


# get openweathermap data
req = requests.get(f'http://api.openweathermap.org/data/2.5/weather?appid={ API_KEY }&id={ CITY_ID }&units=metric&cnt=1')
res = req.json()


# get the results that we actually care about
temperature  = str(round(res['main']['temp']))
weather_id   = res['weather'][0]['icon']
weather_icon = '𥉉 '

# switch the icon depending on the weather id
if   weather_id == '01d': weather_icon = '滛 '   # clear (sun)
elif weather_id == '01n': weather_icon = '望 '   # clear (moon)
elif weather_id == '02d': weather_icon = '杖 '   # cloudy with sun
elif weather_id == '02n': weather_icon = '杖 '   # cloudy with moon
elif weather_id == '03d': weather_icon = '摒 '   # cloudy
elif weather_id == '03n': weather_icon = '摒 '   # cloudy
elif weather_id == '04d': weather_icon = '摒 '   # very cloudy
elif weather_id == '04n': weather_icon = '摒 '   # very cloudy
elif weather_id == '09d': weather_icon = '歹 '   # rain
elif weather_id == '10d': weather_icon = '殺 '   # rain with sun
elif weather_id == '11d': weather_icon = '朗 '   # thunderstorm
elif weather_id == '13d': weather_icon = '流 '   # snow
elif weather_id == '50d': weather_icon = '敖 '   # fog / mist


print('%{T3}%{F#98c379} ' + weather_icon + '%{F-}%{T-}' + temperature + '°')
