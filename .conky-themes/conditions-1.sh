#!/bin/bash

code=$(grep "yweather:forecast" ~/.cache/weather.xml | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | awk "NR==$1{print tolower(\$0) }")

if [[ "$code" == *'partly cloudy'* ]]; then
	echo 'c'
elif [[ "$code" == *'fair'* || "$code" == *'sunny'* ]]; then
	echo 'A'
elif [[ "$code" == *'cloudy'* ]]; then
	echo 'e'
elif [[ "$code" == *'storm'* || "$code" == *'thunder'* ]]; then
	echo 'i'
elif [[ "$code" == *'snow'* ]]; then
	echo 'k'
elif [[ "$code" == *'rain'* ]]; then
	echo 'h'
elif [[ "$code" ==  *'shower'* ]]; then
	echo 'g'
fi


