#!/bin/bash

# getting all hosts (full keys)
#cat inventory.ini
inventory_parsed=`./yq_linux_amd64 eval '.. | select((tag == "!!map" or tag == "!!seq") | not) | (path | join("."))' inventory.ini`

# getting only hosts from the keys
inventory_parsed_hosts_only=""
for inventory_entry in ${inventory_parsed}; do
	i=`echo ${inventory_entry} | sed 's/.*.hosts.//'`
	inventory_parsed_hosts_only+=" ${i}"
done

# parsing host ranges - numbers
### todo - loop for two cases (with and without strides)

# parsing host ranges - characters
### todo - loop for two cases (with and without strides)

# getting rid of duplicates
# sorting inventory entries
inventory_parsed_hosts_only_sorted=$(echo "$inventory_parsed_hosts_only"|tr " " "\n"|sort -u|tr "\n" " ")

# diplaying the final output
for host in ${inventory_parsed_hosts_only_sorted}; do
	echo ${host}
done
