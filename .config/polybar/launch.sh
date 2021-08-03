#!/usr/bin/env bash

killall -q polybar

echo '---' | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar thetek 2>&1 | tee -a /tmp/polybar.log & disown

echo 'Bars launched...'

