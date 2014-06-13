#!/bin/bash

comando=`ping -W2 -c5 -q ping.miami.gigas.com | head -n4 | tail -n1 | awk '{print $4}'`;

if [[ $comando -lt 2 ]]
then
	echo "CRITICAL";
else
	echo "OK";
fi
