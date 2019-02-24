#!/bin/bash

# for i in $( cat items.txt ); do
#     echo -n $i | wc -c;
# done

ls ~/Projects > projects.txt

for i in $( cat projects.txt ); do
    echo -n "$i has $count"
    echo $i | wc -m
done

counter=0
while [ $counter -lt 3 ]; do
    let counter+=1
    echo $counter
done

counter=6
until [ $counter -lt 3 ]; do
    let counter-=1
    echo $counter
done