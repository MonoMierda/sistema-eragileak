#!/bin/bash


echo "Sartu fitxategiaren izena"
read -a fitxategiak

for fitxategia in "${fitxategiak[@]}"; do
    if [ -e "$fitxategia" ]; then
        echo "Fitxategia $fitxategia existitzen da."
        echo "Fitxategiaren Edukia: $fitxategia"
        cat "$fitxategia"
        
    else
        echo "Fitxategia $fitxategia ez da existitzen."
    fi
done