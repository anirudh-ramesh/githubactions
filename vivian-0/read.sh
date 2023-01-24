#!/bin/sh

if [ -f /source/capacity ]; then
	SOC=`cat /source/capacity`
fi

if [ -f /source/charge_now ]; then
	RCC="$((`cat /source/charge_now`/1000))"
fi

if [ -f /source/current_now ]; then
	current_now="$((`cat /source/current_now`/1000))"
fi

if [ -f /source/energy_now ]; then
	RCC="$((`cat /source/energy_now`/1000))"
fi

if [ -f /source/power_now ]; then
	current_now="$((`cat /source/power_now`/1000))"
fi

if [ -f /source/voltage_now ]; then
	voltage_now="$((`cat /source/voltage_now`/1000))"
fi

if [ -f /source/status ]; then
	status=`cat /source/status`
fi

#datetime=`date --rfc-3339=seconds`
#date=`date --iso-8601`

datetime=`date -Iseconds`
date=`date -Idate`

echo "$SOC, $RCC, $current_now, $voltage_now, $energy_now, $power_now, $datetime, $status" >> /destination/$date.csv

if [ ! -s /destination/battery-metadata.log ]; then
	manufacturer=`cat /source/manufacturer`
	model_name=`cat /source/model_name`
	serial_number=`cat /source/serial_number`
	technology=`cat /source/technology`
	echo "$manufacturer, $model_name, $serial_number, $technology" >> /destination/battery-metadata.log
fi
