#!/bin/sh
echo try

v=$(ps -ax | grep mysqld_safe | wc -l)

if [ "$v" = "2" ];
then
	exit 0
else
	exit 1
fi
