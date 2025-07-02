#!/usr/bin/env bash

source func.sh

i=0

until [ $i -eq 30 ]
do
    echo $weird
    i=$((i+1))
done