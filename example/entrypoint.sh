#!/bin/sh

while :
do
    ssmtp recipient@domain.com < mail.txt
    echo "Press [CTRL+C] to stop.."
	sleep 10
done