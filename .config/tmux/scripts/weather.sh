#!/bin/bash

weather=$(curl -s wttr.in/?format=%C)

echo $(curl -s wttr.in/?format=%t)
