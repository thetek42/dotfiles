#!/usr/bin/python3


import json
import requests


DISTRICT = '== DISTRICT ID =='


red    = '#ee6d85'
orange = '#f6955b'
yellow = '#d7a65f'
green  = '#95c561'


# get api data
req = requests.get(f'https://api.corona-zahlen.org/districts/{ DISTRICT }')
res = req.json()


# get the results that we actually care about
incidence = round(int(res['data'][DISTRICT]['weekIncidence']))


# choose color
color = green
if   incidence >= 500: color = red
elif incidence >= 200: color = orange
elif incidence >= 100: color = yellow


print('%{F' + color + '}' + str(incidence) + '%{F-}')

