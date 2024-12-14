#!/bin/bash

weather=$(curl -s wttr.in/?format=%C)
hour=$(date +%H)

case "$weather" in
  "Clear")
    echo ""
    ;;
  "Partly cloudy")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo "󰖕"
    else
      echo "󰼱"
    fi
    ;;
  "Cloudy")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Fog")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Mist")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Light rain")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Heavy rain")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Thunderstorm")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Snow")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Light snow")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Heavy snow")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Sleet")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Hail")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  "Showers")
    if [ "$hour" -ge 6 ] && [ "$hour" -lt 18 ]; then
      echo ""
    else
      echo ""
    fi
    ;;
  *)
    echo "Weather condition is unknown: $weather"
    ;;
esac
