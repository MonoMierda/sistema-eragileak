#!/bin/bash

echo "Idatzi fitxategiaren izena"

read -a fitxategia

for $fitxategia in "${fitxategia[@]}"; do 
    if  [  -e "$fitxategia"]; then 
        echo "Fitxategia $fitxategia existitzen da"
        echo "Fitxategiaren Edukia: $fitxategia"
        cat "$fitxategia"

    else
    echo "Fitxategia $fitxategia ez da existitzen"
    fi
done 